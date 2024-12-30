import 'package:eventpass_app/domain/repositories/attendance/attendance_repository.dart';
import 'package:eventpass_app/domain/usecases/attendance/attendance_usecase.dart';
import 'package:eventpass_app/domain/usecases/face_attendance_confirmation/face_attendance_confirmation_usecase.dart';
import 'package:eventpass_app/domain/usecases/get_attendance_history_by_receptionist/get_attendance_history_by_receptionist.dart';
import 'package:eventpass_app/domain/usecases/pin_attendance_confirmation/pin_attendance_confirmation_usecase.dart';
import 'package:eventpass_app/infrastructure/implementation/attendance/attendance_repository_implementation.dart';
import 'package:eventpass_app/presentation/providers/attendance_data/attendance_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  return AttendanceRepositoryImplementation();
});

final getAttendanceHistoryByReceptionistProvider =
    Provider<GetAttendanceHistoryByReceptionistUsecase>((ref) {
  final repository = ref.watch(attendanceRepositoryProvider);
  return GetAttendanceHistoryByReceptionistUsecase(
      attendanceRepository: repository);
});

final faceAttendanceConfirmationProvider =
    Provider<FaceAttendanceConfirmationUsecase>((ref) {
  final repository = ref.watch(attendanceRepositoryProvider);
  return FaceAttendanceConfirmationUsecase(attendanceRepository: repository);
});

final pinAttendanceConfirmationProvider =
    Provider<PinAttendanceConfirmationUsecase>((ref) {
  final repository = ref.watch(attendanceRepositoryProvider);
  return PinAttendanceConfirmationUsecase(attendanceRepository: repository);
});

final attendanceUsecaseProvider = Provider<AttendanceUsecase>((ref) {
  final repository = ref.watch(attendanceRepositoryProvider);
  return AttendanceUsecase(attendanceRepository: repository);
});

final attendanceProvider =
    StateNotifierProvider<AttendanceNotifier, AttendanceState>((ref) {
  final getAttendanceHistoryByReceptionist =
      ref.watch(getAttendanceHistoryByReceptionistProvider);
  final faceAttendanceConfirmation =
      ref.watch(faceAttendanceConfirmationProvider);
  final pinAttendanceConfirmation =
      ref.watch(pinAttendanceConfirmationProvider);
  final attendanceUsecase = ref.watch(attendanceUsecaseProvider);

  return AttendanceNotifier(
    getAttendanceHistoryByReceptionist: getAttendanceHistoryByReceptionist,
    faceAttendanceConfirmation: faceAttendanceConfirmation,
    pinAttendanceConfirmation: pinAttendanceConfirmation,
    attendanceUsecase: attendanceUsecase,
  );
});
