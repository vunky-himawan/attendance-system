// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_organizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventOrganizerImpl _$$EventOrganizerImplFromJson(Map<String, dynamic> json) =>
    _$EventOrganizerImpl(
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      organizationName: json['organizationName'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      eventOrganizerId: json['eventOrganizerId'] as String?,
      amount: (json['amount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$EventOrganizerImplToJson(
        _$EventOrganizerImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'organizationName': instance.organizationName,
      'address': instance.address,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'eventOrganizerId': instance.eventOrganizerId,
      'amount': instance.amount,
    };
