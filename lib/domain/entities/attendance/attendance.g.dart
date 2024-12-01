// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceImpl _$$AttendanceImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceImpl(
      attendanceId: json['attendanceId'] as String,
      receptionistId: json['receptionistId'] as String,
      participantId: json['participantId'] as String?,
      attendedInAt: DateTime.parse(json['attendedInAt'] as String),
      eventId: json['eventId'] as String,
      attendedMethod:
          $enumDecode(_$AttendanceMethodEnumEnumMap, json['attendedMethod']),
      status: $enumDecode(_$StatusEnumEnumMap, json['status']),
      participant: json['participant'] == null
          ? null
          : Participant.fromJson(json['participant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendanceImplToJson(_$AttendanceImpl instance) =>
    <String, dynamic>{
      'attendanceId': instance.attendanceId,
      'receptionistId': instance.receptionistId,
      'participantId': instance.participantId,
      'attendedInAt': instance.attendedInAt.toIso8601String(),
      'eventId': instance.eventId,
      'attendedMethod': _$AttendanceMethodEnumEnumMap[instance.attendedMethod]!,
      'status': _$StatusEnumEnumMap[instance.status]!,
      'participant': instance.participant,
    };

const _$AttendanceMethodEnumEnumMap = {
  AttendanceMethodEnum.WAJAH: 'WAJAH',
  AttendanceMethodEnum.PIN: 'PIN',
};

const _$StatusEnumEnumMap = {
  StatusEnum.BERHASIL: 'BERHASIL',
  StatusEnum.GAGAL: 'GAGAL',
};
