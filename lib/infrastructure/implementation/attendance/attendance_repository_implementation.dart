import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:eventpass_app/domain/entities/attendance/attendance.dart';
import 'package:eventpass_app/domain/entities/enum/attendance_method_enum.dart';
import 'package:eventpass_app/domain/entities/enum/status_enum.dart';
import 'package:eventpass_app/domain/entities/participant/participant.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:eventpass_app/domain/repositories/attendance/attendance_repository.dart';
import 'package:eventpass_app/infrastructure/config/app_config.dart';

class AttendanceRepositoryImplementation implements AttendanceRepository {
  final Dio? _dio;

  AttendanceRepositoryImplementation({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<User>> attendance(
      XFile photo, String receptionistId, String eventId) async {
    try {
      FormData formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(photo.path),
        'receptionist_id': receptionistId,
        'event_id': eventId,
      });

      final response = await _dio!.post(
        "${AppConfig.apiBaseUrl}/attendance",
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      final participant = Participant(
        participantName: response.data['data']['user']['details']
            ['participant_name'],
        age: response.data['data']['user']['details']['age'],
        gender: response.data['data']['user']['details']['gender'],
        birthDate: response.data['data']['user']['details']['birth_date'],
        participantId: response.data['data']['user']['details']
            ['participant_id'],
        amount: response.data['data']['user']['details']['amount'],
      );

      final user = User(
        userId: response.data['data']['user']['user_id'],
        username: response.data['data']['user']['username'],
        role: response.data['data']['user']['role'],
        photoUrl: response.data['data']['user']['profile_photo'],
        email: response.data['data']['user']['email'],
        details: UserDetails.participant(participant: participant),
      );

      return Result.success(user);
    } on DioException catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<Attendance>> faceAttendanceConfirmation(bool isCorrect,
      String eventId, String receptionistId, String participantId) async {
    try {
      final response = await _dio!.post(
        "${AppConfig.apiBaseUrl}/attendance/face/confirmation",
        data: {
          'is_correct': isCorrect,
          'event_id': eventId,
          'receptionist_id': receptionistId,
          'participant_id': participantId,
        },
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        }),
      );

      final data = response.data;

      if (data['status'] == 'error') {
        return Result.failed(data['detail']);
      }

      final attendance = Attendance(
        attendanceId: data['data']['event_attendance_id'],
        receptionistId: data['data']['receptionist_id'],
        eventId: data['data']['event_id'],
        participantId: data['data']['participant_id'],
        attendedInAt: DateTime.parse(data['data']['attended_in_at']),
        attendedMethod: AttendanceMethodEnum.values.firstWhere(
            (methos) => methos.name == data['data']['attendance_method']),
        status: StatusEnum.values
            .firstWhere((status) => status.name == data['data']['status']),
      );

      return Result.success(attendance);
    } on DioException catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<Attendance>> pinAttendanceConfirmation(
      String pin, String receptionistId) async {
    try {
      final response = await _dio!.post(
        "${AppConfig.apiBaseUrl}/attendance/pin/confirmation",
        data: {
          'pin': pin,
          'receptionist_id': receptionistId,
        },
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        }),
      );

      final data = response.data;

      if (data['status'] == 'error') {
        return Result.failed(data['detail']);
      }

      final attendance = Attendance(
        attendanceId: data['data']['event_attendance_id'],
        receptionistId: data['data']['receptionist_id'],
        eventId: data['data']['event_id'],
        participantId: data['data']['participant_id'],
        attendedInAt: DateTime.parse(data['data']['attended_in_at']),
        attendedMethod: AttendanceMethodEnum.PIN,
        status: StatusEnum.BERHASIL,
      );

      return Result.success(attendance);
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Attendance>>> getAttendanceHistoryByReceptionist(
      String receptionistId) async {
    try {
      final response = await _dio!.get(
        '${AppConfig.apiBaseUrl}/attendance/history/$receptionistId?page=1&size=10',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      final List<dynamic> items = response.data['items'];

      final List<Attendance> attendances = items.map<Attendance>((e) {
        final participant = Participant(
          participantName: e['participant']['participant_name'],
          age: e['participant']['age'],
          gender: e['participant']['gender'],
          birthDate: e['participant']['birth_date'],
          participantId: e['participant']['participant_id'],
          amount: e['participant']['amount'],
        );

        return Attendance(
          attendanceId: e['attendance_id'],
          receptionistId: e['receptionist_id'],
          eventId: e['event_id'],
          participantId: e['participant_id'],
          attendedInAt: DateTime.parse(e['attended_in_at']),
          attendedMethod: AttendanceMethodEnum.values
              .firstWhere((method) => method.name == e['attendance_method']),
          status: StatusEnum.values
              .firstWhere((status) => status.name == e['status']),
          participant: participant,
        );
      }).toList();

      return Result.success(attendances);
    } on DioException catch (e) {
      print("ERROR");
      print(e.message);
      return Result.failed('${e.message}');
    } catch (e) {
      print("ERROR");
      print(e.toString());
      return Result.failed('${e.toString()}');
    }
  }
}
