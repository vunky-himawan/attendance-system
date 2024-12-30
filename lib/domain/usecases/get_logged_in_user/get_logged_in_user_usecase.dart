import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/repositories/authentication/authentication_repository.dart';
import 'package:eventpass_app/domain/repositories/user/user_repository.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetLoggedInUserUsecase
    implements Usecase<Result<Map<String, dynamic>>, void> {
  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  GetLoggedInUserUsecase(
      {required this.userRepository, required this.authenticationRepository});

  @override
  Future<Result<Map<String, dynamic>>> call(void params) async {
    try {
      final token = await _secureStorage.read(key: 'token');

      if (token == null || token.isEmpty) {
        return const Result.failed('Token not found.');
      }

      final result = await authenticationRepository.getLoggedInUser(token);

      if (result.isFailed) {
        return const Result.failed('Failed to get logged in user');
      }

      return Result.success(result.resultValue);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
