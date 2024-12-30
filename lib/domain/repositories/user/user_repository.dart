import 'dart:io';

import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser({
    required String userId,
    required String username,
    required String email,
    required String role,
    String? photo_url,
  });

  Future<Result<Map<String, dynamic>>> getUserByUserId(
      {required String userId});
  Future<Result<User>> getUserDetails({required String userId});
  Future<Result<User>> updateUser({required User user});
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File imageFile});
}
