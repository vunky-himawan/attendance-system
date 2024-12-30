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
import 'package:eventpass_app/presentation/providers/auth/auth_provider_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AttendanceState {
  final String? error;
  final bool isLoading;
  final List<Attendance>? attendances;
  final int retryCount;
  final bool hasMoreData;
  final bool isLoadingMore;

  const AttendanceState({
    this.error,
    this.isLoading = false,
    this.attendances,
    this.retryCount = 0,
    this.hasMoreData = true,
    this.isLoadingMore = false,
  });

  AttendanceState copyWith({
    String? error,
    bool? isLoading,
    List<Attendance>? attendances,
    int? retryCount,
    bool? hasMoreData,
    bool? isLoadingMore,
  }) {
    return AttendanceState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      attendances: attendances ?? this.attendances,
      retryCount: retryCount ?? this.retryCount,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class AttendanceNotifier extends StateNotifier<AttendanceState> {
  final GetAttendanceHistoryByReceptionistUsecase
      _getAttendanceHistoryByReceptionist;
  final FaceAttendanceConfirmationUsecase _faceAttendanceConfirmation;
  final PinAttendanceConfirmationUsecase _pinAttendanceConfirmation;
  final AttendanceUsecase _attendanceUsecase;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AttendanceNotifier({
    required GetAttendanceHistoryByReceptionistUsecase
        getAttendanceHistoryByReceptionist,
    required FaceAttendanceConfirmationUsecase faceAttendanceConfirmation,
    required PinAttendanceConfirmationUsecase pinAttendanceConfirmation,
    required AttendanceUsecase attendanceUsecase,
  })  : _getAttendanceHistoryByReceptionist =
            getAttendanceHistoryByReceptionist,
        _faceAttendanceConfirmation = faceAttendanceConfirmation,
        _pinAttendanceConfirmation = pinAttendanceConfirmation,
        _attendanceUsecase = attendanceUsecase,
        super(const AttendanceState());

  Future<void> attendance({
    required WidgetRef ref,
    required XFile photo,
    required BuildContext context,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final authState = ref.read(authProvider);

      final params = AttendanceParams(
        photo: photo,
        receptionistId: authState.organizationMember!.organizationMemberId,
        eventId: authState.organizationMember!.currentEventId!,
      );

      final result = await _attendanceUsecase(params);

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
            backgroundColor: Colors.red,
            content: Text(
              result.errorMessage!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
      clearError();
    }
  }

  Future<void> faceAttendanceConfirmation({
    required BuildContext context,
    required bool isCorrect,
    required String participantId,
    required WidgetRef ref,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final authState = ref.read(authProvider);

      final params = FaceAttendanceConfirmationParams(
          eventId: authState.organizationMember!.currentEventId!,
          isCorrect: isCorrect,
          participantId: participantId,
          receptionistId: authState.organizationMember!.organizationMemberId);

      final result = await _faceAttendanceConfirmation(params);

      if (result.isSuccess) {
        state = state.copyWith(retryCount: 0);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Berhasil melakukan absensi",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FaceRecognitionPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              result.errorMessage!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
      clearError();
    }
  }

  Future<void> pinAttendanceConfirmation({
    required BuildContext context,
    required String pin,
    required WidgetRef ref,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final authState = ref.read(authProvider);

      final params = PinAttendanceConfirmationParams(
        pin: pin,
        receptionistId: authState.organizationMember!.organizationMemberId,
      );

      final result = await _pinAttendanceConfirmation(params);

      if (result.isSuccess) {
        state = state.copyWith(retryCount: 0);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Berhasil melakukan absensi",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FaceRecognitionPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result.errorMessage!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
      clearError();
    }
  }

  Future<void> getAttendanceHistoryByReceptionist({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    try {
      state = state.copyWith(isLoading: true, isLoadingMore: false);

      final authState = ref.read(authProvider);

      final result = await _getAttendanceHistoryByReceptionist(
          authState.organizationMember!.organizationMemberId);

      if (result.isSuccess) {
        state = state.copyWith(
          attendances: result.resultValue ?? [],
          hasMoreData: result.resultValue?.isNotEmpty ?? false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              result.errorMessage!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
      clearError();
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void resetRetryCount() {
    state = state.copyWith(retryCount: 0);
  }

  void incrementRetryCount() {
    state = state.copyWith(retryCount: state.retryCount + 1);
  }
}
