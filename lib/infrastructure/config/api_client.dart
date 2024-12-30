import 'package:dio/dio.dart';
import 'package:eventpass_app/infrastructure/config/app_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  final Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  ApiClient() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? accessToken = await _secureStorage.read(key: 'token');

        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }

        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          bool success = await _refreshToken();

          if (success) {
            final options = error.requestOptions;
            String? accessToken = await _secureStorage.read(key: 'token');

            options.headers['Authorization'] = 'Bearer $accessToken';

            return handler.resolve(
              await _dio.request(
                options.path,
                options: Options(
                  method: options.method,
                  headers: options.headers,
                ),
                data: options.data,
                queryParameters: options.queryParameters,
              ),
            );
          }
        }
        return handler.next(error);
      },
    ));
  }

  Future<bool> _refreshToken() async {
    String? refreshToken = await _secureStorage.read(key: 'refresh_token');

    if (refreshToken == null) {
      return false;
    }

    try {
      final response = await _dio.post(
        '${AppConfig.apiBaseUrl}/auth/refresh',
        data: {
          'refresh_token': refreshToken,
        }
      );

      final responseData = response.data['data'];

      final newAccessToken = responseData['access_token'];
      final newRefreshToken = responseData['refresh_token'];

      await _secureStorage.write(key: 'token', value: newAccessToken);
      await _secureStorage.write(key: 'refresh_token', value: newRefreshToken);

      return true;

    } catch (e) {
      return false;
    }
  }

  Dio get dio => Dio();
}
