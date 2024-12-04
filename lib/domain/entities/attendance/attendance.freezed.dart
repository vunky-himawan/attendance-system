// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return _Attendance.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  String get attendanceId => throw _privateConstructorUsedError;
  String get receptionistId => throw _privateConstructorUsedError;
  String? get participantId => throw _privateConstructorUsedError;
  DateTime get attendedInAt => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  AttendanceMethodEnum get attendedMethod => throw _privateConstructorUsedError;
  StatusEnum get status => throw _privateConstructorUsedError;
  Participant? get participant => throw _privateConstructorUsedError;

  /// Serializes this Attendance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call(
      {String attendanceId,
      String receptionistId,
      String? participantId,
      DateTime attendedInAt,
      String eventId,
      AttendanceMethodEnum attendedMethod,
      StatusEnum status,
      Participant? participant});

  $ParticipantCopyWith<$Res>? get participant;
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceId = null,
    Object? receptionistId = null,
    Object? participantId = freezed,
    Object? attendedInAt = null,
    Object? eventId = null,
    Object? attendedMethod = null,
    Object? status = null,
    Object? participant = freezed,
  }) {
    return _then(_value.copyWith(
      attendanceId: null == attendanceId
          ? _value.attendanceId
          : attendanceId // ignore: cast_nullable_to_non_nullable
              as String,
      receptionistId: null == receptionistId
          ? _value.receptionistId
          : receptionistId // ignore: cast_nullable_to_non_nullable
              as String,
      participantId: freezed == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String?,
      attendedInAt: null == attendedInAt
          ? _value.attendedInAt
          : attendedInAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      attendedMethod: null == attendedMethod
          ? _value.attendedMethod
          : attendedMethod // ignore: cast_nullable_to_non_nullable
              as AttendanceMethodEnum,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
      participant: freezed == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as Participant?,
    ) as $Val);
  }

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParticipantCopyWith<$Res>? get participant {
    if (_value.participant == null) {
      return null;
    }

    return $ParticipantCopyWith<$Res>(_value.participant!, (value) {
      return _then(_value.copyWith(participant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceImplCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$AttendanceImplCopyWith(
          _$AttendanceImpl value, $Res Function(_$AttendanceImpl) then) =
      __$$AttendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String attendanceId,
      String receptionistId,
      String? participantId,
      DateTime attendedInAt,
      String eventId,
      AttendanceMethodEnum attendedMethod,
      StatusEnum status,
      Participant? participant});

  @override
  $ParticipantCopyWith<$Res>? get participant;
}

/// @nodoc
class __$$AttendanceImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceImpl>
    implements _$$AttendanceImplCopyWith<$Res> {
  __$$AttendanceImplCopyWithImpl(
      _$AttendanceImpl _value, $Res Function(_$AttendanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceId = null,
    Object? receptionistId = null,
    Object? participantId = freezed,
    Object? attendedInAt = null,
    Object? eventId = null,
    Object? attendedMethod = null,
    Object? status = null,
    Object? participant = freezed,
  }) {
    return _then(_$AttendanceImpl(
      attendanceId: null == attendanceId
          ? _value.attendanceId
          : attendanceId // ignore: cast_nullable_to_non_nullable
              as String,
      receptionistId: null == receptionistId
          ? _value.receptionistId
          : receptionistId // ignore: cast_nullable_to_non_nullable
              as String,
      participantId: freezed == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String?,
      attendedInAt: null == attendedInAt
          ? _value.attendedInAt
          : attendedInAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      attendedMethod: null == attendedMethod
          ? _value.attendedMethod
          : attendedMethod // ignore: cast_nullable_to_non_nullable
              as AttendanceMethodEnum,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
      participant: freezed == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as Participant?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceImpl implements _Attendance {
  const _$AttendanceImpl(
      {required this.attendanceId,
      required this.receptionistId,
      this.participantId,
      required this.attendedInAt,
      required this.eventId,
      required this.attendedMethod,
      required this.status,
      this.participant});

  factory _$AttendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceImplFromJson(json);

  @override
  final String attendanceId;
  @override
  final String receptionistId;
  @override
  final String? participantId;
  @override
  final DateTime attendedInAt;
  @override
  final String eventId;
  @override
  final AttendanceMethodEnum attendedMethod;
  @override
  final StatusEnum status;
  @override
  final Participant? participant;

  @override
  String toString() {
    return 'Attendance(attendanceId: $attendanceId, receptionistId: $receptionistId, participantId: $participantId, attendedInAt: $attendedInAt, eventId: $eventId, attendedMethod: $attendedMethod, status: $status, participant: $participant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceImpl &&
            (identical(other.attendanceId, attendanceId) ||
                other.attendanceId == attendanceId) &&
            (identical(other.receptionistId, receptionistId) ||
                other.receptionistId == receptionistId) &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.attendedInAt, attendedInAt) ||
                other.attendedInAt == attendedInAt) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.attendedMethod, attendedMethod) ||
                other.attendedMethod == attendedMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.participant, participant) ||
                other.participant == participant));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      attendanceId,
      receptionistId,
      participantId,
      attendedInAt,
      eventId,
      attendedMethod,
      status,
      participant);

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      __$$AttendanceImplCopyWithImpl<_$AttendanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceImplToJson(
      this,
    );
  }
}

abstract class _Attendance implements Attendance {
  const factory _Attendance(
      {required final String attendanceId,
      required final String receptionistId,
      final String? participantId,
      required final DateTime attendedInAt,
      required final String eventId,
      required final AttendanceMethodEnum attendedMethod,
      required final StatusEnum status,
      final Participant? participant}) = _$AttendanceImpl;

  factory _Attendance.fromJson(Map<String, dynamic> json) =
      _$AttendanceImpl.fromJson;

  @override
  String get attendanceId;
  @override
  String get receptionistId;
  @override
  String? get participantId;
  @override
  DateTime get attendedInAt;
  @override
  String get eventId;
  @override
  AttendanceMethodEnum get attendedMethod;
  @override
  StatusEnum get status;
  @override
  Participant? get participant;

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
