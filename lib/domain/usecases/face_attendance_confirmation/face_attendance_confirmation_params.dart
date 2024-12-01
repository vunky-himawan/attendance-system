class FaceAttendanceConfirmationParams {
  final bool isCorrect;
  final String eventId;
  final String receptionistId;
  final String participantId;

  FaceAttendanceConfirmationParams(
      {required this.isCorrect,
      required this.eventId,
      required this.receptionistId,
      required this.participantId});
}
