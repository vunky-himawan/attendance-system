import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/domain/repositories/user/user_repository.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class GetUserDetailUsecase implements Usecase<Result<User>, String> {
  final UserRepository userRepository;

  GetUserDetailUsecase({required this.userRepository});

  @override
  Future<Result<User>> call(String userId) async {
    try {
      final user = await userRepository.getUserDetails(userId: userId);

      if (user.isFailed) {
        return const Result.failed('User not found');
      }

      return Result.success(user.resultValue!);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
