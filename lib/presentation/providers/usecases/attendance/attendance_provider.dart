import 'package:eventpass_app/domain/usecases/attendance/attendance_usecase.dart';
import 'package:eventpass_app/presentation/providers/repositories/attendance_repository/attendance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_provider.g.dart';

@riverpod
AttendanceUsecase attendanceUsecase(ref) => AttendanceUsecase(
    attendanceRepository: ref.watch(attendanceRepositoryProvider));
