import 'package:dio/dio.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/token/token.dart';

class ApiRequestHandler {
  final Dio _dio;
  final Token? _token;

  ApiRequestHandler(this._dio, [this._token]);

  Future<Result<T>> execute<T>(
    String method,
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final requestOptions = RequestOptions(
        method: method,
        path: endpoint,
        data: data,
        queryParameters: queryParameters,
        headers: {
          if (_token != null) 'Authorization': 'Bearer ${_token.accessToken}',
          ...?headers,
        },
      );

      final response = await _dio.request<T>(
        endpoint,
        options: Options(method: method, headers: requestOptions.headers),
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
      );

      return Result.success(response.data!);
    } on DioException catch (_) {
      return Result.failed("Terjadi kesalahan pada server");
    }
  }
}