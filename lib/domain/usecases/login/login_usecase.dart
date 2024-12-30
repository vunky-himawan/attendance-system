import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/domain/repositories/authentication/authentication_repository.dart';
import 'package:eventpass_app/domain/repositories/user/user_repository.dart';
import 'package:eventpass_app/domain/usecases/login/login_params.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';
import 'package:eventpass_app/utils/decode_token.dart';
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
        params.username,
        params.password,
      );

      if (result.isSuccess) {
        final token = result.resultValue?.accessToken;
        final refreshToken = result.resultValue?.refreshToken;

        if (token == null || refreshToken == null) {
          return const Result.failed('Tokens are missing.');
        }

        final payload = await decodeToken(token);
        
        if (!payload.containsKey('sub')) {
          return const Result.failed('Invalid token payload.');
        }

        final userId = payload['sub'] as String;

        final response = await userRepository.getUserByUserId(userId: userId);

        if (response.isFailed) {
          return Result.failed(response.errorMessage ?? 'Unknown error');
        }

        final userData = response.resultValue ?? {};
        final user = User(
          userId: userId,
          username: userData['username'] ?? 'Unknown',
          role: userData['role'] ?? 'Unknown',
          photoUrl: userData['profile_photo'] ?? '',
        );

        await _secureStorage.write(key: 'token', value: token);
        await _secureStorage.write(key: 'refresh_token', value: refreshToken);

        return Result.success(user);
      } else {
        return Result.failed(result.errorMessage ?? 'Login failed');
      }
    } catch (e) {
      return Result.failed('Error: ${e.toString()}');
    }
  }
}
