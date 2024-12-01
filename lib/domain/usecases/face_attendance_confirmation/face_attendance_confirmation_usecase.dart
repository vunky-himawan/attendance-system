import 'package:eventpass_app/domain/entities/attendance/attendance.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/repositories/attendance/attendance_repository.dart';
import 'package:eventpass_app/domain/usecases/face_attendance_confirmation/face_attendance_confirmation_params.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class FaceAttendanceConfirmationUsecase
    implements Usecase<Result<Attendance>, FaceAttendanceConfirmationParams> {
  final AttendanceRepository attendanceRepository;

  FaceAttendanceConfirmationUsecase({required this.attendanceRepository});

  @override
  Future<Result<Attendance>> call(
      FaceAttendanceConfirmationParams params) async {
    try {
      final result = await attendanceRepository.faceAttendanceConfirmation(
        params.isCorrect,
        params.eventId,
        params.receptionistId,
        params.participantId,
      );

      if (result.isSuccess) {
        return Result.success(result.resultValue!);
      }

      return Result.failed(result.errorMessage!);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
