import 'package:camera/camera.dart';

class AttendanceParams {
  final XFile photo;
  final String receptionistId;
  final String eventId;

  AttendanceParams(
      {required this.photo,
      required this.receptionistId,
      required this.eventId});
}
