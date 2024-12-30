import 'package:eventpass_app/domain/usecases/face_attendance_confirmation/face_attendance_confirmation_usecase.dart';
import 'package:eventpass_app/presentation/providers/repositories/attendance_repository/attendance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'face_attendance_confirmation_provider.g.dart';

@riverpod
FaceAttendanceConfirmationUsecase faceAttendanceConfirmation(ref) =>
    FaceAttendanceConfirmationUsecase(
        attendanceRepository: ref.watch(attendanceRepositoryProvider));
