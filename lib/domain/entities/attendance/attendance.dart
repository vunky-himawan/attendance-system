import 'package:eventpass_app/domain/entities/enum/attendance_method_enum.dart';
import 'package:eventpass_app/domain/entities/enum/status_enum.dart';
import 'package:eventpass_app/domain/entities/participant/participant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    required String attendanceId,
    required String receptionistId,
    String? participantId,
    required DateTime attendedInAt,
    required String eventId,
    required AttendanceMethodEnum attendedMethod,
    required StatusEnum status,
    Participant? participant,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
}
