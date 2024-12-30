// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get eventId => throw _privateConstructorUsedError;
  EventOrganizer? get eventOrganizer => throw _privateConstructorUsedError;
  String get thumbnailPath => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  EventTypeEnum get type => throw _privateConstructorUsedError;
  EventStatusEnum get status => throw _privateConstructorUsedError;
  int get ticketPrice => throw _privateConstructorUsedError;
  int get ticketQuantity => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  List<Speaker>? get speakers => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String eventId,
      EventOrganizer? eventOrganizer,
      String thumbnailPath,
      String title,
      String address,
      String description,
      EventTypeEnum type,
      EventStatusEnum status,
      int ticketPrice,
      int ticketQuantity,
      DateTime startDate,
      List<Speaker>? speakers,
      DateTime? createdAt,
      DateTime? updatedAt});

  $EventOrganizerCopyWith<$Res>? get eventOrganizer;
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventOrganizer = freezed,
    Object? thumbnailPath = null,
    Object? title = null,
    Object? address = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? ticketPrice = null,
    Object? ticketQuantity = null,
    Object? startDate = null,
    Object? speakers = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventOrganizer: freezed == eventOrganizer
          ? _value.eventOrganizer
          : eventOrganizer // ignore: cast_nullable_to_non_nullable
              as EventOrganizer?,
      thumbnailPath: null == thumbnailPath
          ? _value.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventTypeEnum,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatusEnum,
      ticketPrice: null == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as int,
      ticketQuantity: null == ticketQuantity
          ? _value.ticketQuantity
          : ticketQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      speakers: freezed == speakers
          ? _value.speakers
          : speakers // ignore: cast_nullable_to_non_nullable
              as List<Speaker>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventOrganizerCopyWith<$Res>? get eventOrganizer {
    if (_value.eventOrganizer == null) {
      return null;
    }

    return $EventOrganizerCopyWith<$Res>(_value.eventOrganizer!, (value) {
      return _then(_value.copyWith(eventOrganizer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      EventOrganizer? eventOrganizer,
      String thumbnailPath,
      String title,
      String address,
      String description,
      EventTypeEnum type,
      EventStatusEnum status,
      int ticketPrice,
      int ticketQuantity,
      DateTime startDate,
      List<Speaker>? speakers,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $EventOrganizerCopyWith<$Res>? get eventOrganizer;
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventOrganizer = freezed,
    Object? thumbnailPath = null,
    Object? title = null,
    Object? address = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? ticketPrice = null,
    Object? ticketQuantity = null,
    Object? startDate = null,
    Object? speakers = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventOrganizer: freezed == eventOrganizer
          ? _value.eventOrganizer
          : eventOrganizer // ignore: cast_nullable_to_non_nullable
              as EventOrganizer?,
      thumbnailPath: null == thumbnailPath
          ? _value.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventTypeEnum,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatusEnum,
      ticketPrice: null == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as int,
      ticketQuantity: null == ticketQuantity
          ? _value.ticketQuantity
          : ticketQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      speakers: freezed == speakers
          ? _value._speakers
          : speakers // ignore: cast_nullable_to_non_nullable
              as List<Speaker>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventImpl implements _Event {
  const _$EventImpl(
      {required this.eventId,
      this.eventOrganizer,
      required this.thumbnailPath,
      required this.title,
      required this.address,
      required this.description,
      required this.type,
      required this.status,
      required this.ticketPrice,
      required this.ticketQuantity,
      required this.startDate,
      final List<Speaker>? speakers,
      this.createdAt,
      this.updatedAt})
      : _speakers = speakers;

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  final String eventId;
  @override
  final EventOrganizer? eventOrganizer;
  @override
  final String thumbnailPath;
  @override
  final String title;
  @override
  final String address;
  @override
  final String description;
  @override
  final EventTypeEnum type;
  @override
  final EventStatusEnum status;
  @override
  final int ticketPrice;
  @override
  final int ticketQuantity;
  @override
  final DateTime startDate;
  final List<Speaker>? _speakers;
  @override
  List<Speaker>? get speakers {
    final value = _speakers;
    if (value == null) return null;
    if (_speakers is EqualUnmodifiableListView) return _speakers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Event(eventId: $eventId, eventOrganizer: $eventOrganizer, thumbnailPath: $thumbnailPath, title: $title, address: $address, description: $description, type: $type, status: $status, ticketPrice: $ticketPrice, ticketQuantity: $ticketQuantity, startDate: $startDate, speakers: $speakers, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventOrganizer, eventOrganizer) ||
                other.eventOrganizer == eventOrganizer) &&
            (identical(other.thumbnailPath, thumbnailPath) ||
                other.thumbnailPath == thumbnailPath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.ticketPrice, ticketPrice) ||
                other.ticketPrice == ticketPrice) &&
            (identical(other.ticketQuantity, ticketQuantity) ||
                other.ticketQuantity == ticketQuantity) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            const DeepCollectionEquality().equals(other._speakers, _speakers) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      eventOrganizer,
      thumbnailPath,
      title,
      address,
      description,
      type,
      status,
      ticketPrice,
      ticketQuantity,
      startDate,
      const DeepCollectionEquality().hash(_speakers),
      createdAt,
      updatedAt);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {required final String eventId,
      final EventOrganizer? eventOrganizer,
      required final String thumbnailPath,
      required final String title,
      required final String address,
      required final String description,
      required final EventTypeEnum type,
      required final EventStatusEnum status,
      required final int ticketPrice,
      required final int ticketQuantity,
      required final DateTime startDate,
      final List<Speaker>? speakers,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$EventImpl;

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  String get eventId;
  @override
  EventOrganizer? get eventOrganizer;
  @override
  String get thumbnailPath;
  @override
  String get title;
  @override
  String get address;
  @override
  String get description;
  @override
  EventTypeEnum get type;
  @override
  EventStatusEnum get status;
  @override
  int get ticketPrice;
  @override
  int get ticketQuantity;
  @override
  DateTime get startDate;
  @override
  List<Speaker>? get speakers;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
