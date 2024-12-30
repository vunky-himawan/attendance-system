import 'package:camera/camera.dart';
import 'package:eventpass_app/domain/usecases/register/event_organizer_register_params.dart';
import 'package:eventpass_app/domain/usecases/register/participant_register_params.dart';

class RegisterParams {
  final String username;
  final String email;
  final String password;
  final String role;
  XFile? faceImage;
  ParticipantRegisterParams? participantRegisterParams;
  EventOrganizerRegisterParams? eventOrganizerRegisterParams;

  RegisterParams({
    required this.username,
    required this.email,
    required this.password,
    required this.role,
    this.faceImage,
    this.participantRegisterParams,
    this.eventOrganizerRegisterParams,
  });
}
