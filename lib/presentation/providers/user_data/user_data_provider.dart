import 'package:camera/camera.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/usecases/login/login_params.dart';
import 'package:eventpass_app/domain/usecases/login/login_usecase.dart';
import 'package:eventpass_app/domain/usecases/register/event_organizer_register_params.dart';
import 'package:eventpass_app/domain/usecases/register/participant_register_params.dart';
import 'package:eventpass_app/domain/usecases/register/register_params.dart';
import 'package:eventpass_app/domain/usecases/register/register_usecase.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:eventpass_app/presentation/providers/usecases/login/login_provider.dart';
import 'package:eventpass_app/presentation/providers/usecases/register/notifier/register_notifier.dart';
import 'package:eventpass_app/presentation/providers/usecases/register/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  FutureOr<String> build() async {
    // Check token on initialization
    final token = await _secureStorage.read(key: 'token');

    return token ?? '';
  }

  Future<void> register({
    required String username,
    required String password,
    required String email,
    required String role,
    XFile? faceImage,
    ParticipantRegisterParams? participantRegisterParams,
    EventOrganizerRegisterParams? eventOrganizerRegisterParams,
  }) async {
    try {
      state = const AsyncLoading();

      RegisterUsecase registerUsecase = ref.read(registerUsecaseProvider);

      var result = await registerUsecase(
        RegisterParams(
          username: username,
          password: password,
          email: email,
          role: role,
          faceImage: faceImage,
          participantRegisterParams: participantRegisterParams,
          eventOrganizerRegisterParams: eventOrganizerRegisterParams,
        ),
      );

      switch (result) {
        case Success(value: _):
          ref.read(registerProvider.notifier).resetStep();
          ref.read(routerProvider).go('/success', extra: {
            'redirectTo': '/login',
            'message': 'Pendaftaran berhasil',
            'buttonText': 'Kembali ke Login',
          });

        case Failed(:final message):
          print("ERROR NICH REGISTER: ${message}");
          ref.read(registerProvider.notifier).resetStep();
          ref.read(routerProvider).go('/error', extra: {
            'isAttendance': false,
            'message': message,
            'redirectTo': '/',
          });
          state = AsyncError(FlutterError(message), StackTrace.current);
      }
    } catch (e) {
      state = AsyncError(FlutterError(e.toString()), StackTrace.current);
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading();

    LoginUsecase loginUsecase = ref.read(loginUsecaseProvider);

    var result =
        await loginUsecase(LoginParams(username: username, password: password));

    switch (result) {
      case Success(value: final user):
        String role = user.role;

        state = AsyncValue.data(user.toString());

        switch (role) {
          case 'RECEPTIONIST':
            ref.read(routerProvider).go('/receptionist');
            break;
          case 'EVENT_ORGANIZER':
            ref.read(routerProvider).go('/event-organizer');
            break;
          case 'SUPERADMIN':
            ref.read(routerProvider).go('/superadmin');
            break;
          case 'PARTICIPANT':
            ref.read(routerProvider).go('/participant');
            break;
        }

      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
    }
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'token');
    await _secureStorage.delete(key: 'user_id');

    state = const AsyncData('');
    ref.read(routerProvider).go('/');
  }
}
