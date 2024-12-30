import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/repositories/authentication/authentication_repository.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogoutUsecase implements Usecase<Result<bool>, void> {
  final AuthenticationRepository authenticationRepository;
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  LogoutUsecase({required this.authenticationRepository});

  @override
  Future<Result<bool>> call(void params) async {
    try {
      final token = await _flutterSecureStorage.read(key: 'token');

      final result = await authenticationRepository.logout(token.toString());

      if (result.isFailed) {
        return const Result.failed('Failed to logout');
      }

      await _flutterSecureStorage.deleteAll();

      return const Result.success(true);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
