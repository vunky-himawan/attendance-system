import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/token/token.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/domain/repositories/authentication/authentication_repository.dart';
import 'package:eventpass_app/infrastructure/config/api_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final Dio? _dio;
  final _secureStorage = const FlutterSecureStorage();

  AuthenticationRepositoryImplementation({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<User?>> getLoggedInUser() async {
    try {
      final userId = await _secureStorage.read(key: 'user_id');

      if (userId == null) {
        return const Result.success(null);
      }

      final response = await _dio!.get(
        "${ApiConfig.baseUrl}/users/$userId",
      );

      User user = User(
        userId: response.data['data']['user_id'] as String,
        username: response.data['data']['username'] as String,
        email: response.data['data']['email'] as String,
        role: response.data['data']['role'] as String,
        photoUrl: response.data['data']['photo_url'] as String,
      );

      return Result.success(user);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<Token>> login(String username, String password) async {
    try {
      final response = await _dio!.post(
        "${ApiConfig.baseUrl}/auth/login",
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
      print(e);
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> refreshToken(String refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
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
        "${ApiConfig.baseUrl}/auth/register",
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

  @override
  Future<Result<void>> saveToken(Token token) {
    // TODO: implement saveToken
    throw UnimplementedError();
  }
}
