// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      participantName: json['participantName'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      birthDate: json['birthDate'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      participantId: json['participantId'] as String?,
      amount: (json['amount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'participantName': instance.participantName,
      'age': instance.age,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'participantId': instance.participantId,
      'amount': instance.amount,
    };
