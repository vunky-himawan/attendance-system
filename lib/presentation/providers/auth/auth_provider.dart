import 'package:camera/camera.dart';
import 'package:eventpass_app/domain/entities/event_organizer/event_organizer.dart';
import 'package:eventpass_app/domain/entities/organization_member/organization_member.dart';
import 'package:eventpass_app/domain/entities/participant/participant.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/domain/usecases/get_logged_in_user/get_logged_in_user_usecase.dart';
import 'package:eventpass_app/domain/usecases/login/login_params.dart';
import 'package:eventpass_app/domain/usecases/login/login_usecase.dart';
import 'package:eventpass_app/domain/usecases/logout/logout_usecase.dart';
import 'package:eventpass_app/domain/usecases/register/event_organizer_register_params.dart';
import 'package:eventpass_app/domain/usecases/register/participant_register_params.dart';
import 'package:eventpass_app/domain/usecases/register/register_params.dart';
import 'package:eventpass_app/domain/usecases/register/register_usecase.dart';
import 'package:eventpass_app/main.dart';
import 'package:eventpass_app/presentation/pages/auth/login/login_page.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/main_page.dart';
import 'package:eventpass_app/presentation/pages/participant/main_page.dart';
import 'package:eventpass_app/presentation/pages/receptionist/home/home_page.dart';
import 'package:eventpass_app/utils/decode_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthState {
  final String? error;
  final bool isLoading;
  final Participant? participant;
  final User? user;
  final EventOrganizer? eventOrganizer;
  final OrganizationMember? organizationMember;

  const AuthState({
    this.error,
    this.isLoading = false,
    this.participant,
    this.user,
    this.eventOrganizer,
    this.organizationMember,
  });

  AuthState copyWith({
    String? error,
    bool? isLoading,
    Participant? participant,
    User? user,
    EventOrganizer? eventOrganizer,
    OrganizationMember? organizationMember,
  }) {
    return AuthState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      participant: participant ?? this.participant,
      user: user ?? this.user,
      eventOrganizer: eventOrganizer ?? this.eventOrganizer,
      organizationMember: organizationMember ?? this.organizationMember,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final GetLoggedInUserUsecase _getLoggedInUserUsecase;
  final LogoutUsecase _logoutUsecase;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthNotifier({
    required LoginUsecase loginUsecase,
    required RegisterUsecase registerUsecase,
    required GetLoggedInUserUsecase getLoggedInUserUsecase,
    required LogoutUsecase logoutUsecase,
  })  : _loginUsecase = loginUsecase,
        _getLoggedInUserUsecase = getLoggedInUserUsecase,
        _registerUsecase = registerUsecase,
        _logoutUsecase = logoutUsecase,
        super(const AuthState());

  Future<void> initializeUserFromToken() async {
    try {
      state = state.copyWith(isLoading: true);

      final token = await _secureStorage.read(key: 'token');

      if (token == null || token.isEmpty) {
        Navigator.pushAndRemoveUntil(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
          (route) => false,
        );
        return;
      }

      final result = await _getLoggedInUserUsecase(null);

      if (result.isFailed) {
        state = state.copyWith(error: result.errorMessage);
        return;
      }

      final data = result.resultValue!['data'] as Map<String, dynamic>;

      final user = User(
        userId: data['user_id'] as String,
        username: data['username'] as String,
        email: data['email'] as String,
        role: data['role'] as String,
        photoUrl: data['profile_photo'],
      );

      if (user.role == "PARTICIPANT") {
        final participant =
            result.resultValue!['data']['details'] as Map<String, dynamic>;

        final participantDetails = Participant(
          participantId: participant['participant_id'],
          participantName: participant['participant_name'],
          amount: participant['amount'],
          age: participant['age'],
          gender: participant['gender'],
          birthDate: participant['birth_date'],
        );

        state = state.copyWith(participant: participantDetails);
      } else if (user.role == "RECEPTIONIST") {
        final eventId = await decodeToken(token);

        final organizationMember =
            result.resultValue!['data']['details'] as Map<String, dynamic>;

        final organizationMemberDetails = OrganizationMember(
          organizationMemberId: organizationMember['organization_member_id'],
          userId: organizationMember['user_id'],
          eventOrganizerId: organizationMember['event_organizer_id'],
          currentEventId: eventId['event_id'],
        );

        state = state.copyWith(organizationMember: organizationMemberDetails);
      }

      state = state.copyWith(user: user);
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final params = LoginParams(username: username, password: password);

      final result = await _loginUsecase(params);

      if (result.isSuccess) {
        state = state.copyWith(user: result.resultValue!);

        if (state.user!.role == 'PARTICIPANT') {
          Navigator.pushReplacement(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => const ParticipantMainPage(),
            ),
          );
        } else if (state.user!.role == 'EVENT_ORGANIZER') {
          Navigator.pushReplacement(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => const EventOrganizerMainPage(),
            ),
          );
        } else if (state.user!.role == 'RECEPTIONIST') {
          Navigator.pushReplacement(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => const ReceptionistHomePage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }
      } else {
        state = state.copyWith(error: result.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
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
      state = state.copyWith(isLoading: true);

      final params = RegisterParams(
        username: username,
        password: password,
        email: email,
        role: role,
        faceImage: faceImage,
        participantRegisterParams: participantRegisterParams,
        eventOrganizerRegisterParams: eventOrganizerRegisterParams,
      );

      final result = await _registerUsecase(params);

      switch (result) {
        case Success(value: _):
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Berhasil mendaftar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
          break;
        case Failed(:final message):
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> logout() async {
    try {
      state = state.copyWith(isLoading: true);

      final result = await _logoutUsecase(null);

      print('NIH RESULT $result');

      if (result.isSuccess) {
        state = const AuthState();

        Navigator.pushAndRemoveUntil(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
          (route) => false,
        );
      } else {
        state = state.copyWith(error: result.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getParticipantDetails() async {
    try {
      state = state.copyWith(isLoading: true);

      final user = await _getLoggedInUserUsecase(null);

      if (user.isFailed) {
        state = state.copyWith(error: user.errorMessage);
        return;
      }

      if (user.resultValue!['data']['role'] == 'PARTICIPANT') {
        final details =
            user.resultValue!['data']['details'] as Map<String, dynamic>;

        final participant = Participant(
          participantName: details['participant_name'],
          age: details['age'],
          gender: details['gender'],
          birthDate: details['birth_date'],
          participantId: details['participant_id'],
          amount: details['amount'],
        );

        state = state.copyWith(participant: participant);
      } else {
        state = state.copyWith(participant: null);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getOrganizationMemberDetails() async {
    try {
      state = state.copyWith(isLoading: true);

      final user = await _getLoggedInUserUsecase(null);

      if (user.isFailed) {
        state = state.copyWith(error: user.errorMessage);
        return;
      }

      if (user.resultValue!['data']['role'] != 'EVENT_ORGANIZER') {
        state = state.copyWith(organizationMember: null);
        return;
      }

      final details =
          user.resultValue!['data']['details'] as Map<String, dynamic>;

      final organizationMember = OrganizationMember(
          organizationMemberId: details['organization_member_id'],
          eventOrganizerId: details['event_organizer_id'],
          userId: details['user_id']);

      state = state.copyWith(organizationMember: organizationMember);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void updateEventOrganizer(EventOrganizer eventOrganizer) {
    state = state.copyWith(eventOrganizer: eventOrganizer);
  }

  void updateParticipant(Participant participant) {
    state = state.copyWith(participant: participant);
  }
}
