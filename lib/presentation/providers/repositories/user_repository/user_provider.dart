import 'package:eventpass_app/domain/repositories/user/user_repository.dart';
import 'package:eventpass_app/infrastructure/implementation/user/user_repository_implementation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
UserRepository userRepository(ref) => UserRepositoryImplementation();
