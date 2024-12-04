import 'package:eventpass_app/domain/entities/attendance/attendance.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/repositories/attendance/attendance_repository.dart';
import 'package:eventpass_app/domain/usecases/pin_attendance_confirmation/pin_attendance_confirmation_params.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class PinAttendanceConfirmationUsecase
    implements Usecase<Result<Attendance>, PinAttendanceConfirmationParams> {
  final AttendanceRepository attendanceRepository;

  PinAttendanceConfirmationUsecase({required this.attendanceRepository});

  @override
  Future<Result<Attendance>> call(
      PinAttendanceConfirmationParams params) async {
    try {
      final result = await attendanceRepository.pinAttendanceConfirmation(
          params.pin, params.receptionistId);

      if (result.isSuccess) {
        return Result.success(result.resultValue!);
      }

      return Result.failed(result.errorMessage!);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
