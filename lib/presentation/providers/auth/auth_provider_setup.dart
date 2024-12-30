import 'package:eventpass_app/domain/repositories/authentication/authentication_repository.dart';
import 'package:eventpass_app/domain/repositories/user/user_repository.dart';
import 'package:eventpass_app/domain/usecases/get_logged_in_user/get_logged_in_user_usecase.dart';
import 'package:eventpass_app/domain/usecases/login/login_usecase.dart';
import 'package:eventpass_app/domain/usecases/logout/logout_usecase.dart';
import 'package:eventpass_app/domain/usecases/register/register_usecase.dart';
import 'package:eventpass_app/infrastructure/implementation/authentication/authentication_repository_implementation.dart';
import 'package:eventpass_app/infrastructure/implementation/user/user_repository_implementation.dart';
import 'package:eventpass_app/presentation/providers/auth/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthenticationRepository>((ref) {
  return AuthenticationRepositoryImplementation();
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImplementation();
});

final loginUsecaseProvider = Provider<LoginUsecase>((ref) {
  final authenticationRepository = ref.watch(authRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  return LoginUsecase(
      authenticationRepository: authenticationRepository,
      userRepository: userRepository);
});

final registerUsecaseProvider = Provider<RegisterUsecase>((ref) {
  final authenticationRepository = ref.watch(authRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  return RegisterUsecase(
      authenticationRepository: authenticationRepository,
      userRepository: userRepository);
});

final logoutUsecaseProvider = Provider<LogoutUsecase>((ref) {
  final authenticationRepository = ref.watch(authRepositoryProvider);
  return LogoutUsecase(authenticationRepository: authenticationRepository);
});

final getLoggedInUserUsecaseProvider = Provider<GetLoggedInUserUsecase>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  final authenticationRepository = ref.watch(authRepositoryProvider);
  return GetLoggedInUserUsecase(
      userRepository: userRepository,
      authenticationRepository: authenticationRepository);
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final loginUsecase = ref.watch(loginUsecaseProvider);
  final registerUsecase = ref.watch(registerUsecaseProvider);
  final logoutUsecase = ref.watch(logoutUsecaseProvider);
  final getLoggedInUserUsecase = ref.watch(getLoggedInUserUsecaseProvider);

  return AuthNotifier(
    getLoggedInUserUsecase: getLoggedInUserUsecase,
    loginUsecase: loginUsecase,
    registerUsecase: registerUsecase,
    logoutUsecase: logoutUsecase,
  );
});
