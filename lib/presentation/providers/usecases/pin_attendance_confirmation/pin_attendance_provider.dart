import 'package:eventpass_app/domain/usecases/pin_attendance_confirmation/pin_attendance_confirmation_usecase.dart';
import 'package:eventpass_app/presentation/providers/repositories/attendance_repository/attendance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_attendance_provider.g.dart';

@riverpod
PinAttendanceConfirmationUsecase pinAttendanceConfirmation(ref) =>
    PinAttendanceConfirmationUsecase(
        attendanceRepository: ref.watch(attendanceRepositoryProvider));
