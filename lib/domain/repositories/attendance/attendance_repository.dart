import 'package:camera/camera.dart';
import 'package:eventpass_app/domain/entities/attendance/attendance.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';

abstract interface class AttendanceRepository {
  Future<Result<User>> attendance(
      XFile photo, String receptionistId, String eventId);

  Future<Result<Attendance>> faceAttendanceConfirmation(
    bool isCorrect,
    String eventId,
    String receptionistId,
    String participantId,
  );

  Future<Result<Attendance>> pinAttendanceConfirmation(
      String pin, String receptionistId);

  Future<Result<List<Attendance>>> getAttendanceHistoryByReceptionist(
      String receptionistId);
}
