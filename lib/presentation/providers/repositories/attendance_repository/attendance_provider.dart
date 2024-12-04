import 'package:eventpass_app/domain/repositories/attendance/attendance_repository.dart';
import 'package:eventpass_app/infrastructure/implementation/attendance/attendance_repository_implementation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_provider.g.dart';

@riverpod
AttendanceRepository attendanceRepository(ref) =>
    AttendanceRepositoryImplementation();
