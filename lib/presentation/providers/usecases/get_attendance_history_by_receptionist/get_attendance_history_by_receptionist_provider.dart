import 'package:eventpass_app/domain/usecases/get_attendance_history_by_receptionist/get_attendance_history_by_receptionist.dart';
import 'package:eventpass_app/presentation/providers/repositories/attendance_repository/attendance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_attendance_history_by_receptionist_provider.g.dart';

@riverpod
GetAttendanceHistoryByReceptionistUsecase getAttendanceHistoryByReceptionist(
        ref) =>
    GetAttendanceHistoryByReceptionistUsecase(
        attendanceRepository: ref.watch(attendanceRepositoryProvider));
