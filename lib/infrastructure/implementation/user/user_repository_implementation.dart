import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/domain/repositories/user/user_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepositoryImplementation implements UserRepository {
  final Dio? _dio;
  final _secureStorage = const FlutterSecureStorage();

  UserRepositoryImplementation({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<User>> createUser(
      {required String userId,
      required String username,
      required String email,
      required String role,
      String? photo_url}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> getUserByUserId({required String userId}) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File imageFile}) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}
