
import 'package:eventpass_app/domain/usecases/login/login_usecase.dart';
import 'package:eventpass_app/presentation/providers/repositories/authentication_repository/authentication_provider.dart';
import 'package:eventpass_app/presentation/providers/repositories/user_repository/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
LoginUsecase loginUsecase(ref) => LoginUsecase(
      authenticationRepository: ref.watch(authenticationRepositoryProvider),
      userRepository: ref.watch(userRepositoryProvider),
    );
