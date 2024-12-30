import 'package:camera/camera.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/token/token.dart';

abstract interface class AuthenticationRepository {
  Future<Result<String>> registration(
      String username,
      String password,
      String role,
      String email,
      XFile? faceImage,
      Map<String, dynamic>? details);
  Future<Result<Token>> login(String username, String password);
  Future<Result<bool>> logout(String refreshToken);
  Future<Result<dynamic>> getLoggedInUser(String token);
}
