// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_organizer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventOrganizer _$EventOrganizerFromJson(Map<String, dynamic> json) {
  return _EventOrganizer.fromJson(json);
}

/// @nodoc
mixin _$EventOrganizer {
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get organizationName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get eventOrganizerId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  /// Serializes this EventOrganizer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventOrganizer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventOrganizerCopyWith<EventOrganizer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventOrganizerCopyWith<$Res> {
  factory $EventOrganizerCopyWith(
          EventOrganizer value, $Res Function(EventOrganizer) then) =
      _$EventOrganizerCopyWithImpl<$Res, EventOrganizer>;
  @useResult
  $Res call(
      {String email,
      String phoneNumber,
      String organizationName,
      String address,
      String description,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? eventOrganizerId,
      int amount});
}

/// @nodoc
class _$EventOrganizerCopyWithImpl<$Res, $Val extends EventOrganizer>
    implements $EventOrganizerCopyWith<$Res> {
  _$EventOrganizerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventOrganizer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phoneNumber = null,
    Object? organizationName = null,
    Object? address = null,
    Object? description = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? eventOrganizerId = freezed,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventOrganizerId: freezed == eventOrganizerId
          ? _value.eventOrganizerId
          : eventOrganizerId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventOrganizerImplCopyWith<$Res>
    implements $EventOrganizerCopyWith<$Res> {
  factory _$$EventOrganizerImplCopyWith(_$EventOrganizerImpl value,
          $Res Function(_$EventOrganizerImpl) then) =
      __$$EventOrganizerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String phoneNumber,
      String organizationName,
      String address,
      String description,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? eventOrganizerId,
      int amount});
}

/// @nodoc
class __$$EventOrganizerImplCopyWithImpl<$Res>
    extends _$EventOrganizerCopyWithImpl<$Res, _$EventOrganizerImpl>
    implements _$$EventOrganizerImplCopyWith<$Res> {
  __$$EventOrganizerImplCopyWithImpl(
      _$EventOrganizerImpl _value, $Res Function(_$EventOrganizerImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventOrganizer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phoneNumber = null,
    Object? organizationName = null,
    Object? address = null,
    Object? description = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? eventOrganizerId = freezed,
    Object? amount = null,
  }) {
    return _then(_$EventOrganizerImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventOrganizerId: freezed == eventOrganizerId
          ? _value.eventOrganizerId
          : eventOrganizerId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventOrganizerImpl implements _EventOrganizer {
  const _$EventOrganizerImpl(
      {required this.email,
      required this.phoneNumber,
      required this.organizationName,
      required this.address,
      required this.description,
      this.createdAt,
      this.updatedAt,
      this.eventOrganizerId,
      this.amount = 0});

  factory _$EventOrganizerImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventOrganizerImplFromJson(json);

  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String organizationName;
  @override
  final String address;
  @override
  final String description;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? eventOrganizerId;
  @override
  @JsonKey()
  final int amount;

  @override
  String toString() {
    return 'EventOrganizer(email: $email, phoneNumber: $phoneNumber, organizationName: $organizationName, address: $address, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, eventOrganizerId: $eventOrganizerId, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOrganizerImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.eventOrganizerId, eventOrganizerId) ||
                other.eventOrganizerId == eventOrganizerId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      phoneNumber,
      organizationName,
      address,
      description,
      createdAt,
      updatedAt,
      eventOrganizerId,
      amount);

  /// Create a copy of EventOrganizer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventOrganizerImplCopyWith<_$EventOrganizerImpl> get copyWith =>
      __$$EventOrganizerImplCopyWithImpl<_$EventOrganizerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventOrganizerImplToJson(
      this,
    );
  }
}

abstract class _EventOrganizer implements EventOrganizer {
  const factory _EventOrganizer(
      {required final String email,
      required final String phoneNumber,
      required final String organizationName,
      required final String address,
      required final String description,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? eventOrganizerId,
      final int amount}) = _$EventOrganizerImpl;

  factory _EventOrganizer.fromJson(Map<String, dynamic> json) =
      _$EventOrganizerImpl.fromJson;

  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get organizationName;
  @override
  String get address;
  @override
  String get description;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get eventOrganizerId;
  @override
  int get amount;

  /// Create a copy of EventOrganizer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventOrganizerImplCopyWith<_$EventOrganizerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
