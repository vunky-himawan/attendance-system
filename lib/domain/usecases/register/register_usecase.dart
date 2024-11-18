import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/domain/repositories/authentication/authentication_repository.dart';
import 'package:eventpass_app/domain/repositories/user/user_repository.dart';
import 'package:eventpass_app/domain/usecases/register/register_params.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class RegisterUsecase implements Usecase<Result<User>, RegisterParams> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  RegisterUsecase({
    required this.authenticationRepository,
    required this.userRepository,
  });

  @override
  Future<Result<User>> call(RegisterParams params) async {
    try {
      Map<String, dynamic>? details;
      if (params.role == 'PARTICIPANT' && params.faceImage != null) {
        details = await params.participantRegisterParams!.toMap();
      } else if (params.role == 'EVENT_ORGANIZER') {
        details = params.eventOrganizerRegisterParams!.toMap();
      } else {
        details = null;
      }

      final result = await authenticationRepository.registration(
        params.username,
        params.password,
        params.role,
        params.email,
        params.faceImage,
        details,
      );

      if (result.isSuccess) {
        final userId = result.resultValue as String;

        User user = User(
          userId: userId,
          username: params.username,
          email: params.email,
          role: params.role,
          photoUrl: '',
        );

        return Result.success(user);
      } else {
        return Result.failed(result.errorMessage!);
      }
    } catch (e) {
      print("ERROR DI USE CASE REGISTER: ${e.toString()}");
      return Result.failed(e.toString());
    }
  }
}
