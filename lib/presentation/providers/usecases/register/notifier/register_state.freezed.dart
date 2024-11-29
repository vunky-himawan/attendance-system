// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterState {
// Common registration progress
  int get currentStep => throw _privateConstructorUsedError;
  String? get selectedRole =>
      throw _privateConstructorUsedError; // Account Info (common)
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  XFile? get faceImage =>
      throw _privateConstructorUsedError; // Role-specific data
  ParticipantRegisterParams? get participantParams =>
      throw _privateConstructorUsedError;
  EventOrganizerRegisterParams? get organizerParams =>
      throw _privateConstructorUsedError;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {int currentStep,
      String? selectedRole,
      String? username,
      String? email,
      String? password,
      XFile? faceImage,
      ParticipantRegisterParams? participantParams,
      EventOrganizerRegisterParams? organizerParams});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? selectedRole = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? faceImage = freezed,
    Object? participantParams = freezed,
    Object? organizerParams = freezed,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      selectedRole: freezed == selectedRole
          ? _value.selectedRole
          : selectedRole // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      faceImage: freezed == faceImage
          ? _value.faceImage
          : faceImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      participantParams: freezed == participantParams
          ? _value.participantParams
          : participantParams // ignore: cast_nullable_to_non_nullable
              as ParticipantRegisterParams?,
      organizerParams: freezed == organizerParams
          ? _value.organizerParams
          : organizerParams // ignore: cast_nullable_to_non_nullable
              as EventOrganizerRegisterParams?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterStateImplCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$RegisterStateImplCopyWith(
          _$RegisterStateImpl value, $Res Function(_$RegisterStateImpl) then) =
      __$$RegisterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentStep,
      String? selectedRole,
      String? username,
      String? email,
      String? password,
      XFile? faceImage,
      ParticipantRegisterParams? participantParams,
      EventOrganizerRegisterParams? organizerParams});
}

/// @nodoc
class __$$RegisterStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateImpl>
    implements _$$RegisterStateImplCopyWith<$Res> {
  __$$RegisterStateImplCopyWithImpl(
      _$RegisterStateImpl _value, $Res Function(_$RegisterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? selectedRole = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? faceImage = freezed,
    Object? participantParams = freezed,
    Object? organizerParams = freezed,
  }) {
    return _then(_$RegisterStateImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      selectedRole: freezed == selectedRole
          ? _value.selectedRole
          : selectedRole // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      faceImage: freezed == faceImage
          ? _value.faceImage
          : faceImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      participantParams: freezed == participantParams
          ? _value.participantParams
          : participantParams // ignore: cast_nullable_to_non_nullable
              as ParticipantRegisterParams?,
      organizerParams: freezed == organizerParams
          ? _value.organizerParams
          : organizerParams // ignore: cast_nullable_to_non_nullable
              as EventOrganizerRegisterParams?,
    ));
  }
}

/// @nodoc

class _$RegisterStateImpl implements _RegisterState {
  const _$RegisterStateImpl(
      {this.currentStep = 0,
      this.selectedRole,
      this.username,
      this.email,
      this.password,
      this.faceImage,
      this.participantParams,
      this.organizerParams});

// Common registration progress
  @override
  @JsonKey()
  final int currentStep;
  @override
  final String? selectedRole;
// Account Info (common)
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final XFile? faceImage;
// Role-specific data
  @override
  final ParticipantRegisterParams? participantParams;
  @override
  final EventOrganizerRegisterParams? organizerParams;

  @override
  String toString() {
    return 'RegisterState(currentStep: $currentStep, selectedRole: $selectedRole, username: $username, email: $email, password: $password, faceImage: $faceImage, participantParams: $participantParams, organizerParams: $organizerParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.selectedRole, selectedRole) ||
                other.selectedRole == selectedRole) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.faceImage, faceImage) ||
                other.faceImage == faceImage) &&
            (identical(other.participantParams, participantParams) ||
                other.participantParams == participantParams) &&
            (identical(other.organizerParams, organizerParams) ||
                other.organizerParams == organizerParams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, selectedRole,
      username, email, password, faceImage, participantParams, organizerParams);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      __$$RegisterStateImplCopyWithImpl<_$RegisterStateImpl>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState(
          {final int currentStep,
          final String? selectedRole,
          final String? username,
          final String? email,
          final String? password,
          final XFile? faceImage,
          final ParticipantRegisterParams? participantParams,
          final EventOrganizerRegisterParams? organizerParams}) =
      _$RegisterStateImpl;

// Common registration progress
  @override
  int get currentStep;
  @override
  String? get selectedRole; // Account Info (common)
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get password;
  @override
  XFile? get faceImage; // Role-specific data
  @override
  ParticipantRegisterParams? get participantParams;
  @override
  EventOrganizerRegisterParams? get organizerParams;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
