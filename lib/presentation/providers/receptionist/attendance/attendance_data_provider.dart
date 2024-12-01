import 'package:camera/camera.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:eventpass_app/domain/entities/attendance/attendance.dart';
import 'package:eventpass_app/domain/usecases/attendance/attendance_params.dart';
import 'package:eventpass_app/domain/usecases/attendance/attendance_usecase.dart';
import 'package:eventpass_app/domain/usecases/face_attendance_confirmation/face_attendance_confirmation_params.dart';
import 'package:eventpass_app/domain/usecases/face_attendance_confirmation/face_attendance_confirmation_usecase.dart';
import 'package:eventpass_app/domain/usecases/get_attendance_history_by_receptionist/get_attendance_history_by_receptionist.dart';
import 'package:eventpass_app/domain/usecases/pin_attendance_confirmation/pin_attendance_confirmation_params.dart';
import 'package:eventpass_app/domain/usecases/pin_attendance_confirmation/pin_attendance_confirmation_usecase.dart';
import 'package:eventpass_app/presentation/pages/receptionist/attendance_confirmation/attendance_confirmation_page.dart';
import 'package:eventpass_app/presentation/pages/receptionist/face_recognition/face_recognition_page.dart';
import 'package:eventpass_app/presentation/providers/usecases/attendance/attendance_provider.dart';
import 'package:eventpass_app/presentation/providers/usecases/face_attendance_confirmation/face_attendance_confirmation_provider.dart';
import 'package:eventpass_app/presentation/providers/usecases/get_attendance_history_by_receptionist/get_attendance_history_by_receptionist_provider.dart';
import 'package:eventpass_app/presentation/providers/usecases/pin_attendance_confirmation/pin_attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_data_provider.g.dart';

@riverpod
class AttendanceData extends _$AttendanceData {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  List<Attendance> attendances = [];
  int currentPage = 1;
  bool hasMoreData = true;
  bool isLoadingMore = false;
  int retryCount = 0;

  @override
  FutureOr<String> build() async {
    // Reset data awal
    attendances = [];
    currentPage = 1;
    hasMoreData = true;
    retryCount = 0;

    await getAttendanceHistoryByReceptionist();
    return await _secureStorage.read(key: 'user_id') ?? '';
  }

  Future<void> attendance(BuildContext context, XFile photo) async {
    try {
      state = const AsyncLoading();

      final token = await _secureStorage.read(key: 'token');

      if (token == null || token.isEmpty) {
        throw FlutterError('Token not found.');
      }

      final jwtData = JWT.decode(token.toString());

      final receptionistId = jwtData.payload['sub']['organization_member_id'];
      final eventId = jwtData.payload['sub']['event_id'];

      AttendanceUsecase attendanceUsecase = ref.read(attendanceUsecaseProvider);

      var result = await attendanceUsecase(
        AttendanceParams(
            photo: photo, receptionistId: receptionistId, eventId: eventId),
      );

      if (result.isSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AttendanceConfirmationPage(),
            settings: RouteSettings(arguments: result.resultValue),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.errorMessage!,
                style: const TextStyle(color: Colors.white)),
            backgroundColor: Colors.red,
          ),
        );

        resetRetryCount();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FaceRecognitionPage(),
          ),
        );

        state = AsyncError(
            FlutterError(result.errorMessage.toString()), StackTrace.current);
        clearError();
      }
    } catch (e) {
      state = AsyncError(FlutterError(e.toString()), StackTrace.current);
      clearError();
    }
  }

  Future<void> faceAttendanceConfirmation(
    BuildContext context,
    bool isCorrect,
    String participantId,
  ) async {
    try {
      state = const AsyncLoading();
      final token = await _secureStorage.read(key: 'token');

      if (token == null || token.isEmpty) {
        throw FlutterError('Token not found.');
      }

      final jwtData = JWT.decode(token.toString());

      final String receptionistId =
          jwtData.payload['sub']['organization_member_id'];
      final String eventId = jwtData.payload['sub']['event_id'] as String;

      FaceAttendanceConfirmationUsecase faceAttendanceConfirmationUsecase =
          ref.read(faceAttendanceConfirmationProvider);

      var result = await faceAttendanceConfirmationUsecase(
        FaceAttendanceConfirmationParams(
          isCorrect: isCorrect,
          eventId: eventId,
          receptionistId: receptionistId,
          participantId: participantId,
        ),
      );

      if (result.isFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.errorMessage!,
                style: const TextStyle(color: Colors.white)),
            backgroundColor: Colors.red,
          ),
        );

        resetRetryCount();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FaceRecognitionPage(),
          ),
        );

        state = AsyncError(
            FlutterError(result.errorMessage.toString()), StackTrace.current);

        clearError();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Berhasil melakukan absensi",
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.green,
          ),
        );

        resetRetryCount();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FaceRecognitionPage(),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal mengirim foto. Coba lagi!'),
        ),
      );
      state = AsyncError(FlutterError(e.toString()), StackTrace.current);
      clearError();
    }
  }

  Future<void> pinAttendanceConfirmation(
    BuildContext context,
    String pin,
  ) async {
    try {
      state = const AsyncLoading();

      final token = await _secureStorage.read(key: 'token');

      if (token == null || token.isEmpty) {
        throw FlutterError('Token not found.');
      }

      final jwtData = JWT.decode(token.toString());

      PinAttendanceConfirmationUsecase pinAttendanceConfirmationUsecase =
          ref.read(pinAttendanceConfirmationProvider);

      final receptionistId = jwtData.payload['sub']['organization_member_id'];

      var result = await pinAttendanceConfirmationUsecase(
        PinAttendanceConfirmationParams(
          pin: pin,
          receptionistId: receptionistId,
        ),
      );

      if (result.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Berhasil melakukan absensi',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FaceRecognitionPage(),
          ),
        );
      } else {
        state = AsyncError(
            FlutterError(result.errorMessage.toString()), StackTrace.current);

        clearError();
      }
    } catch (e) {
      state = AsyncError(FlutterError(e.toString()), StackTrace.current);

      clearError();
    }
  }

  Future<void> getAttendanceHistoryByReceptionist() async {
    try {
      if (!hasMoreData || isLoadingMore) return;

      isLoadingMore = true;

      if (attendances.isEmpty) {
        state = const AsyncLoading();
      }

      final token = await _secureStorage.read(key: 'token');

      if (token == null || token.isEmpty) {
        throw FlutterError('Token not found.');
      }

      final jwtData = JWT.decode(token.toString());

      GetAttendanceHistoryByReceptionistUsecase
          getAttendanceHistoryByReceptionistUsecase =
          ref.read(getAttendanceHistoryByReceptionistProvider);

      final receptionistId = jwtData.payload['sub']['organization_member_id'];

      var result = await getAttendanceHistoryByReceptionistUsecase(
        receptionistId,
      );

      if (result.isSuccess) {
        final newAttendances = result.resultValue ?? [];
        if (newAttendances.isEmpty) {
          hasMoreData = false;
        } else {
          attendances.addAll(newAttendances);
          currentPage++;
        }

        state = const AsyncData("Data loaded successfully");
      } else {
        state = AsyncError(
            FlutterError(result.errorMessage.toString()), StackTrace.current);
        clearError();
      }
    } catch (e) {
      state = AsyncError(FlutterError(e.toString()), StackTrace.current);
      clearError();
    } finally {
      isLoadingMore = false;
    }
  }

  void refreshData() async {
    attendances = [];
    currentPage = 1;
    hasMoreData = true;

    await getAttendanceHistoryByReceptionist();
  }

  void clearError() {
    if (state.hasError) {
      state = const AsyncData("");
    }
  }

  void resetRetryCount() {
    retryCount = 0;
  }
}
