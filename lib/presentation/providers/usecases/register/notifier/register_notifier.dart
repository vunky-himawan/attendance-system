import 'package:eventpass_app/domain/usecases/register/event_organizer_register_params.dart';
import 'package:eventpass_app/domain/usecases/register/participant_register_params.dart';
import 'package:eventpass_app/domain/usecases/register/register_params.dart';
import 'package:eventpass_app/presentation/providers/usecases/register/notifier/register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier();
});

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier() : super(const RegisterState());

  void setRole(String role) {
    state = state.copyWith(
      selectedRole: role,
    );
  }

  void setAccountInfo({
    required String username,
    required String email,
    required String password,
  }) {
    state = state.copyWith(
      username: username,
      email: email,
      password: password,
    );
  }

  void setParticipantInfo({
    required String fullName,
    required String age,
    required String birthDate,
    required String gender,
  }) {
    state = state.copyWith(
      participantParams: ParticipantRegisterParams(
        fullName: fullName,
        age: age,
        birthDate: birthDate,
        gender: gender,
      ),
    );
  }

  void setOrganizerInfo({
    required String organizationName,
    required String organizationDescription,
    required String organizationAddress,
    required String organizationEmail,
    required String organizationPhone,
  }) {
    final organizerParams = EventOrganizerRegisterParams(
      organizationName: organizationName,
      organizationDescription: organizationDescription,
      organizationAddress: organizationAddress,
      organizationEmail: organizationEmail,
      organizationPhone: organizationPhone,
    );
    state = state.copyWith(organizerParams: organizerParams);
  }

  RegisterParams? getRegisterParams() {
    if (state.username == null ||
        state.email == null ||
        state.password == null ||
        state.selectedRole == null) {
      return null;
    }

    return RegisterParams(
      username: state.username!,
      email: state.email!,
      password: state.password!,
      role: state.selectedRole!,
      participantRegisterParams: state.participantParams,
      eventOrganizerRegisterParams: state.organizerParams,
    );
  }

  void nextStep() {
    if (state.currentStep < 3) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void prevStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void resetStep() {
    state = const RegisterState();
  }
}
