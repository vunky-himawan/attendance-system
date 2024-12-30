// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  UserDetails? get details => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String userId,
      String username,
      String? email,
      String role,
      String? photoUrl,
      UserDetails? details});

  $UserDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? email = freezed,
    Object? role = null,
    Object? photoUrl = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as UserDetails?,
    ) as $Val);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDetailsCopyWith<$Res>? get details {
    if (_value.details == null) {
      return null;
    }

    return $UserDetailsCopyWith<$Res>(_value.details!, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String username,
      String? email,
      String role,
      String? photoUrl,
      UserDetails? details});

  @override
  $UserDetailsCopyWith<$Res>? get details;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? email = freezed,
    Object? role = null,
    Object? photoUrl = freezed,
    Object? details = freezed,
  }) {
    return _then(_$UserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as UserDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.userId,
      required this.username,
      this.email,
      required this.role,
      this.photoUrl,
      this.details});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String userId;
  @override
  final String username;
  @override
  final String? email;
  @override
  final String role;
  @override
  final String? photoUrl;
  @override
  final UserDetails? details;

  @override
  String toString() {
    return 'User(userId: $userId, username: $username, email: $email, role: $role, photoUrl: $photoUrl, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, username, email, role, photoUrl, details);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String userId,
      required final String username,
      final String? email,
      required final String role,
      final String? photoUrl,
      final UserDetails? details}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get userId;
  @override
  String get username;
  @override
  String? get email;
  @override
  String get role;
  @override
  String? get photoUrl;
  @override
  UserDetails? get details;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'participant':
      return ParticipantDetails.fromJson(json);
    case 'eventOrganizer':
      return EventOrganizerDetails.fromJson(json);
    case 'organizationMember':
      return OrganizationMemberDetails.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UserDetails',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UserDetails {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Participant participant) participant,
    required TResult Function(EventOrganizer eventOrganizer) eventOrganizer,
    required TResult Function(
            String organizationMemberId, String userId, String eventOrganizerId)
        organizationMember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Participant participant)? participant,
    TResult? Function(EventOrganizer eventOrganizer)? eventOrganizer,
    TResult? Function(String organizationMemberId, String userId,
            String eventOrganizerId)?
        organizationMember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Participant participant)? participant,
    TResult Function(EventOrganizer eventOrganizer)? eventOrganizer,
    TResult Function(String organizationMemberId, String userId,
            String eventOrganizerId)?
        organizationMember,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantDetails value) participant,
    required TResult Function(EventOrganizerDetails value) eventOrganizer,
    required TResult Function(OrganizationMemberDetails value)
        organizationMember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantDetails value)? participant,
    TResult? Function(EventOrganizerDetails value)? eventOrganizer,
    TResult? Function(OrganizationMemberDetails value)? organizationMember,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantDetails value)? participant,
    TResult Function(EventOrganizerDetails value)? eventOrganizer,
    TResult Function(OrganizationMemberDetails value)? organizationMember,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this UserDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsCopyWith<$Res> {
  factory $UserDetailsCopyWith(
          UserDetails value, $Res Function(UserDetails) then) =
      _$UserDetailsCopyWithImpl<$Res, UserDetails>;
}

/// @nodoc
class _$UserDetailsCopyWithImpl<$Res, $Val extends UserDetails>
    implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ParticipantDetailsImplCopyWith<$Res> {
  factory _$$ParticipantDetailsImplCopyWith(_$ParticipantDetailsImpl value,
          $Res Function(_$ParticipantDetailsImpl) then) =
      __$$ParticipantDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Participant participant});

  $ParticipantCopyWith<$Res> get participant;
}

/// @nodoc
class __$$ParticipantDetailsImplCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$ParticipantDetailsImpl>
    implements _$$ParticipantDetailsImplCopyWith<$Res> {
  __$$ParticipantDetailsImplCopyWithImpl(_$ParticipantDetailsImpl _value,
      $Res Function(_$ParticipantDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participant = null,
  }) {
    return _then(_$ParticipantDetailsImpl(
      participant: null == participant
          ? _value.participant
          : participant // ignore: cast_nullable_to_non_nullable
              as Participant,
    ));
  }

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParticipantCopyWith<$Res> get participant {
    return $ParticipantCopyWith<$Res>(_value.participant, (value) {
      return _then(_value.copyWith(participant: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantDetailsImpl implements ParticipantDetails {
  const _$ParticipantDetailsImpl(
      {required this.participant, final String? $type})
      : $type = $type ?? 'participant';

  factory _$ParticipantDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantDetailsImplFromJson(json);

  @override
  final Participant participant;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserDetails.participant(participant: $participant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantDetailsImpl &&
            (identical(other.participant, participant) ||
                other.participant == participant));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, participant);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantDetailsImplCopyWith<_$ParticipantDetailsImpl> get copyWith =>
      __$$ParticipantDetailsImplCopyWithImpl<_$ParticipantDetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Participant participant) participant,
    required TResult Function(EventOrganizer eventOrganizer) eventOrganizer,
    required TResult Function(
            String organizationMemberId, String userId, String eventOrganizerId)
        organizationMember,
  }) {
    return participant(this.participant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Participant participant)? participant,
    TResult? Function(EventOrganizer eventOrganizer)? eventOrganizer,
    TResult? Function(String organizationMemberId, String userId,
            String eventOrganizerId)?
        organizationMember,
  }) {
    return participant?.call(this.participant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Participant participant)? participant,
    TResult Function(EventOrganizer eventOrganizer)? eventOrganizer,
    TResult Function(String organizationMemberId, String userId,
            String eventOrganizerId)?
        organizationMember,
    required TResult orElse(),
  }) {
    if (participant != null) {
      return participant(this.participant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantDetails value) participant,
    required TResult Function(EventOrganizerDetails value) eventOrganizer,
    required TResult Function(OrganizationMemberDetails value)
        organizationMember,
  }) {
    return participant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantDetails value)? participant,
    TResult? Function(EventOrganizerDetails value)? eventOrganizer,
    TResult? Function(OrganizationMemberDetails value)? organizationMember,
  }) {
    return participant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantDetails value)? participant,
    TResult Function(EventOrganizerDetails value)? eventOrganizer,
    TResult Function(OrganizationMemberDetails value)? organizationMember,
    required TResult orElse(),
  }) {
    if (participant != null) {
      return participant(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantDetailsImplToJson(
      this,
    );
  }
}

abstract class ParticipantDetails implements UserDetails {
  const factory ParticipantDetails({required final Participant participant}) =
      _$ParticipantDetailsImpl;

  factory ParticipantDetails.fromJson(Map<String, dynamic> json) =
      _$ParticipantDetailsImpl.fromJson;

  Participant get participant;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantDetailsImplCopyWith<_$ParticipantDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventOrganizerDetailsImplCopyWith<$Res> {
  factory _$$EventOrganizerDetailsImplCopyWith(
          _$EventOrganizerDetailsImpl value,
          $Res Function(_$EventOrganizerDetailsImpl) then) =
      __$$EventOrganizerDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EventOrganizer eventOrganizer});

  $EventOrganizerCopyWith<$Res> get eventOrganizer;
}

/// @nodoc
class __$$EventOrganizerDetailsImplCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$EventOrganizerDetailsImpl>
    implements _$$EventOrganizerDetailsImplCopyWith<$Res> {
  __$$EventOrganizerDetailsImplCopyWithImpl(_$EventOrganizerDetailsImpl _value,
      $Res Function(_$EventOrganizerDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventOrganizer = null,
  }) {
    return _then(_$EventOrganizerDetailsImpl(
      eventOrganizer: null == eventOrganizer
          ? _value.eventOrganizer
          : eventOrganizer // ignore: cast_nullable_to_non_nullable
              as EventOrganizer,
    ));
  }

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventOrganizerCopyWith<$Res> get eventOrganizer {
    return $EventOrganizerCopyWith<$Res>(_value.eventOrganizer, (value) {
      return _then(_value.copyWith(eventOrganizer: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$EventOrganizerDetailsImpl implements EventOrganizerDetails {
  const _$EventOrganizerDetailsImpl(
      {required this.eventOrganizer, final String? $type})
      : $type = $type ?? 'eventOrganizer';

  factory _$EventOrganizerDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventOrganizerDetailsImplFromJson(json);

  @override
  final EventOrganizer eventOrganizer;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserDetails.eventOrganizer(eventOrganizer: $eventOrganizer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOrganizerDetailsImpl &&
            (identical(other.eventOrganizer, eventOrganizer) ||
                other.eventOrganizer == eventOrganizer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventOrganizer);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventOrganizerDetailsImplCopyWith<_$EventOrganizerDetailsImpl>
      get copyWith => __$$EventOrganizerDetailsImplCopyWithImpl<
          _$EventOrganizerDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Participant participant) participant,
    required TResult Function(EventOrganizer eventOrganizer) eventOrganizer,
    required TResult Function(
            String organizationMemberId, String userId, String eventOrganizerId)
        organizationMember,
  }) {
    return eventOrganizer(this.eventOrganizer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Participant participant)? participant,
    TResult? Function(EventOrganizer eventOrganizer)? eventOrganizer,
    TResult? Function(String organizationMemberId, String userId,
            String eventOrganizerId)?
        organizationMember,
  }) {
    return eventOrganizer?.call(this.eventOrganizer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Participant participant)? participant,
    TResult Function(EventOrganizer eventOrganizer)? eventOrganizer,
    TResult Function(String organizationMemberId, String userId,
            String eventOrganizerId)?
        organizationMember,
    required TResult orElse(),
  }) {
    if (eventOrganizer != null) {
      return eventOrganizer(this.eventOrganizer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantDetails value) participant,
    required TResult Function(EventOrganizerDetails value) eventOrganizer,
    required TResult Function(OrganizationMemberDetails value)
        organizationMember,
  }) {
    return eventOrganizer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantDetails value)? participant,
    TResult? Function(EventOrganizerDetails value)? eventOrganizer,
    TResult? Function(OrganizationMemberDetails value)? organizationMember,
  }) {
    return eventOrganizer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantDetails value)? participant,
    TResult Function(EventOrganizerDetails value)? eventOrganizer,
    TResult Function(OrganizationMemberDetails value)? organizationMember,
    required TResult orElse(),
  }) {
    if (eventOrganizer != null) {
      return eventOrganizer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventOrganizerDetailsImplToJson(
      this,
    );
  }
}

abstract class EventOrganizerDetails implements UserDetails {
  const factory EventOrganizerDetails(
          {required final EventOrganizer eventOrganizer}) =
      _$EventOrganizerDetailsImpl;

  factory EventOrganizerDetails.fromJson(Map<String, dynamic> json) =
      _$EventOrganizerDetailsImpl.fromJson;

  EventOrganizer get eventOrganizer;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventOrganizerDetailsImplCopyWith<_$EventOrganizerDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrganizationMemberDetailsImplCopyWith<$Res> {
  factory _$$OrganizationMemberDetailsImplCopyWith(
          _$OrganizationMemberDetailsImpl value,
          $Res Function(_$OrganizationMemberDetailsImpl) then) =
      __$$OrganizationMemberDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String organizationMemberId, String userId, String eventOrganizerId});
}

/// @nodoc
class __$$OrganizationMemberDetailsImplCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$OrganizationMemberDetailsImpl>
    implements _$$OrganizationMemberDetailsImplCopyWith<$Res> {
  __$$OrganizationMemberDetailsImplCopyWithImpl(
      _$OrganizationMemberDetailsImpl _value,
      $Res Function(_$OrganizationMemberDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationMemberId = null,
    Object? userId = null,
    Object? eventOrganizerId = null,
  }) {
    return _then(_$OrganizationMemberDetailsImpl(
      organizationMemberId: null == organizationMemberId
          ? _value.organizationMemberId
          : organizationMemberId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventOrganizerId: null == eventOrganizerId
          ? _value.eventOrganizerId
          : eventOrganizerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganizationMemberDetailsImpl implements OrganizationMemberDetails {
  const _$OrganizationMemberDetailsImpl(
      {required this.organizationMemberId,
      required this.userId,
      required this.eventOrganizerId,
      final String? $type})
      : $type = $type ?? 'organizationMember';

  factory _$OrganizationMemberDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationMemberDetailsImplFromJson(json);

  @override
  final String organizationMemberId;
  @override
  final String userId;
  @override
  final String eventOrganizerId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserDetails.organizationMember(organizationMemberId: $organizationMemberId, userId: $userId, eventOrganizerId: $eventOrganizerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationMemberDetailsImpl &&
            (identical(other.organizationMemberId, organizationMemberId) ||
                other.organizationMemberId == organizationMemberId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventOrganizerId, eventOrganizerId) ||
                other.eventOrganizerId == eventOrganizerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, organizationMemberId, userId, eventOrganizerId);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationMemberDetailsImplCopyWith<_$OrganizationMemberDetailsImpl>
      get copyWith => __$$OrganizationMemberDetailsImplCopyWithImpl<
          _$OrganizationMemberDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Participant participant) participant,
    required TResult Function(EventOrganizer eventOrganizer) eventOrganizer,
    required TResult Function(
            String organizationMemberId, String userId, String eventOrganizerId)
        organizationMember,
  }) {
    return organizationMember(organizationMemberId, userId, eventOrganizerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Participant participant)? participant,
    TResult? Function(EventOrganizer eventOrganizer)? eventOrganizer,
    TResult? Function(String organizationMemberId, String userId,
            String eventOrganizerId)?
        organizationMember,
  }) {
    return organizationMember?.call(
        organizationMemberId, userId, eventOrganizerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Participant participant)? participant,
    TResult Function(EventOrganizer eventOrganizer)? eventOrganizer,
    TResult Function(String organizationMemberId, String userId,
            String eventOrganizerId)?
        organizationMember,
    required TResult orElse(),
  }) {
    if (organizationMember != null) {
      return organizationMember(organizationMemberId, userId, eventOrganizerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantDetails value) participant,
    required TResult Function(EventOrganizerDetails value) eventOrganizer,
    required TResult Function(OrganizationMemberDetails value)
        organizationMember,
  }) {
    return organizationMember(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantDetails value)? participant,
    TResult? Function(EventOrganizerDetails value)? eventOrganizer,
    TResult? Function(OrganizationMemberDetails value)? organizationMember,
  }) {
    return organizationMember?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantDetails value)? participant,
    TResult Function(EventOrganizerDetails value)? eventOrganizer,
    TResult Function(OrganizationMemberDetails value)? organizationMember,
    required TResult orElse(),
  }) {
    if (organizationMember != null) {
      return organizationMember(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationMemberDetailsImplToJson(
      this,
    );
  }
}

abstract class OrganizationMemberDetails implements UserDetails {
  const factory OrganizationMemberDetails(
          {required final String organizationMemberId,
          required final String userId,
          required final String eventOrganizerId}) =
      _$OrganizationMemberDetailsImpl;

  factory OrganizationMemberDetails.fromJson(Map<String, dynamic> json) =
      _$OrganizationMemberDetailsImpl.fromJson;

  String get organizationMemberId;
  String get userId;
  String get eventOrganizerId;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizationMemberDetailsImplCopyWith<_$OrganizationMemberDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
