import 'package:eventpass_app/domain/entities/attendance/attendance.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/repositories/attendance/attendance_repository.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class GetAttendanceHistoryByReceptionistUsecase
    implements Usecase<Result<List<Attendance>>, String> {
  final AttendanceRepository attendanceRepository;

  GetAttendanceHistoryByReceptionistUsecase(
      {required this.attendanceRepository});

  @override
  Future<Result<List<Attendance>>> call(String params) async {
    try {
      final result =
          await attendanceRepository.getAttendanceHistoryByReceptionist(params);

      if (result.isSuccess) {
        return Result.success(result.resultValue!.toList());
      }

      return Result.failed(result.errorMessage!);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
