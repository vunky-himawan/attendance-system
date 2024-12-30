import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/domain/repositories/attendance/attendance_repository.dart';
import 'package:eventpass_app/domain/usecases/attendance/attendance_params.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class AttendanceUsecase implements Usecase<Result<dynamic>, AttendanceParams> {
  final AttendanceRepository attendanceRepository;

  AttendanceUsecase({required this.attendanceRepository});

  @override
  Future<Result<User>> call(AttendanceParams params) async {
    try {
      final result = await attendanceRepository.attendance(
          params.photo, params.receptionistId, params.eventId);

      if (result.isSuccess) {
        return Result.success(result.resultValue!);
      }

      return Result.failed(result.errorMessage!);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
