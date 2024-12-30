// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['userId'] as String,
      username: json['username'] as String,
      email: json['email'] as String?,
      role: json['role'] as String,
      photoUrl: json['photoUrl'] as String?,
      details: json['details'] == null
          ? null
          : UserDetails.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'role': instance.role,
      'photoUrl': instance.photoUrl,
      'details': instance.details,
    };

_$ParticipantDetailsImpl _$$ParticipantDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipantDetailsImpl(
      participant:
          Participant.fromJson(json['participant'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ParticipantDetailsImplToJson(
        _$ParticipantDetailsImpl instance) =>
    <String, dynamic>{
      'participant': instance.participant,
      'runtimeType': instance.$type,
    };

_$EventOrganizerDetailsImpl _$$EventOrganizerDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$EventOrganizerDetailsImpl(
      eventOrganizer: EventOrganizer.fromJson(
          json['eventOrganizer'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EventOrganizerDetailsImplToJson(
        _$EventOrganizerDetailsImpl instance) =>
    <String, dynamic>{
      'eventOrganizer': instance.eventOrganizer,
      'runtimeType': instance.$type,
    };

_$OrganizationMemberDetailsImpl _$$OrganizationMemberDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganizationMemberDetailsImpl(
      organizationMemberId: json['organizationMemberId'] as String,
      userId: json['userId'] as String,
      eventOrganizerId: json['eventOrganizerId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OrganizationMemberDetailsImplToJson(
        _$OrganizationMemberDetailsImpl instance) =>
    <String, dynamic>{
      'organizationMemberId': instance.organizationMemberId,
      'userId': instance.userId,
      'eventOrganizerId': instance.eventOrganizerId,
      'runtimeType': instance.$type,
    };
