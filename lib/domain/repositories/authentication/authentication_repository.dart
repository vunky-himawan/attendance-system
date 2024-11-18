import 'package:camera/camera.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/token/token.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';

abstract interface class AuthenticationRepository {
  Future<Result<String>> registration(
      String username,
      String password,
      String role,
      String email,
      XFile? faceImage,
      Map<String, dynamic>? details);
  Future<Result<Token>> login(String username, String password);
  Future<Result<void>> saveToken(Token token);
  Future<Result<void>> refreshToken(String refreshToken);
  Future<Result<void>> logout();
  Future<Result<User?>> getLoggedInUser();
}
