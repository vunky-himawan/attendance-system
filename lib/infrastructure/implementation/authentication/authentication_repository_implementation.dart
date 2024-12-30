import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/token/token.dart';
import 'package:eventpass_app/domain/repositories/authentication/authentication_repository.dart';
import 'package:eventpass_app/infrastructure/config/api_client.dart';
import 'package:eventpass_app/infrastructure/config/app_config.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final Dio? _dio;
  final ApiClient _apiClient = ApiClient();

  AuthenticationRepositoryImplementation({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<Token>> login(String username, String password) async {
    try {
      final response = await _dio!.post(
        "${AppConfig.apiBaseUrl}/auth/login",
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      Token token = Token(
        accessToken: response.data['data']['access_token'],
        refreshToken: response.data['data']['refresh_token'],
      );

      return Result.success(token);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<dynamic>> getLoggedInUser(String token) async {
    try {
      final response = await _apiClient.dio.get(
        "${AppConfig.apiBaseUrl}/auth/get_logged_in_user",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      return Result.success(response.data);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<bool>> logout(String refreshToken) async {
    try {
      final response = await _dio!.post(
        "${AppConfig.apiBaseUrl}/auth/logout",
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $refreshToken',
        }),
      );

      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      return const Result.success(true);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<String>> registration(
      String username,
      String password,
      String role,
      String email,
      XFile? faceImage,
      Map<String, dynamic>? details) async {
    try {
      FormData formData;

      if (role == 'PARTICIPANT' && faceImage != null) {
        formData = FormData.fromMap({
          'username': username,
          'password': password,
          'email': email,
          'role': role,
          'face_photo': await MultipartFile.fromFile(faceImage.path),
          'details': details != null ? jsonEncode(details) : null,
        });
      } else if (role == 'EVENT_ORGANIZER') {
        formData = FormData.fromMap({
          'username': username,
          'password': password,
          'email': email,
          'role': role,
          'details': details != null ? jsonEncode(details) : null,
        });
      } else {
        formData = FormData.fromMap({
          'username': username,
          'password': password,
          'email': email,
          'role': role,
        });
      }

      final response = await _dio!.post(
        "${AppConfig.apiBaseUrl}/auth/register",
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      return Result.success(response.data['data']['user_id']);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
