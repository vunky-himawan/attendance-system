// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpeakerImpl _$$SpeakerImplFromJson(Map<String, dynamic> json) =>
    _$SpeakerImpl(
      speakerId: json['speakerId'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      socialMediaLink: json['socialMediaLink'] as String,
      company: json['company'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SpeakerImplToJson(_$SpeakerImpl instance) =>
    <String, dynamic>{
      'speakerId': instance.speakerId,
      'name': instance.name,
      'title': instance.title,
      'socialMediaLink': instance.socialMediaLink,
      'company': instance.company,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
