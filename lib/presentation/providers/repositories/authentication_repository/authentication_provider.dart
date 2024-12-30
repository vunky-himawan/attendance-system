import 'package:eventpass_app/domain/repositories/authentication/authentication_repository.dart';
import 'package:eventpass_app/infrastructure/implementation/authentication/authentication_repository_implementation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
AuthenticationRepository authenticationRepository(ref) =>
    AuthenticationRepositoryImplementation();
