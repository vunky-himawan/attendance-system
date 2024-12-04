import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/domain/repositories/authentication/authentication_repository.dart';
import 'package:eventpass_app/domain/repositories/user/user_repository.dart';
import 'package:eventpass_app/domain/usecases/login/login_params.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginUsecase implements Usecase<Result<User>, LoginParams> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final _secureStorage = const FlutterSecureStorage();

  LoginUsecase({
    required this.authenticationRepository,
    required this.userRepository,
  });

  @override
  Future<Result<User>> call(LoginParams params) async {
    try {
      final result = await authenticationRepository.login(
          params.username, params.password);

      if (result.isSuccess) {
        final token = result.resultValue?.accessToken;

        final data = JWT.decode(token.toString());

        final Map<String, dynamic> subData =
            data.payload['sub'] as Map<String, dynamic>;

        final User user = User(
          userId: subData['id'] as String,
          username: subData['username'] as String,
          role: subData['role'] as String,
        );

        // Store token using flutter_secure_storage
        try {
          await _secureStorage.write(key: 'token', value: token);
          await _secureStorage.write(key: 'user_id', value: user.userId);
        } catch (e) {
          return Result.failed(e.toString());
        }

        return Result.success(user);
      } else {
        return Result.failed(result.errorMessage!);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
