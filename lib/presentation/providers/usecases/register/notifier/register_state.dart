import 'package:camera/camera.dart';
import 'package:eventpass_app/domain/usecases/register/event_organizer_register_params.dart';
import 'package:eventpass_app/domain/usecases/register/participant_register_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    // Common registration progress
    @Default(0) int currentStep,
    String? selectedRole,

    // Account Info (common)
    String? username,
    String? email,
    String? password,
    XFile? faceImage,

    // Role-specific data
    ParticipantRegisterParams? participantParams,
    EventOrganizerRegisterParams? organizerParams,
  }) = _RegisterState;
}
