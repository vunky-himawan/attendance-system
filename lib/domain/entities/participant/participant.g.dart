// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      participant_name: json['participant_name'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      birth_date: json['birth_date'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
      participant_id: json['participant_id'] as String?,
      amount: (json['amount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'participant_name': instance.participant_name,
      'age': instance.age,
      'gender': instance.gender,
      'birth_date': instance.birth_date,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
      'participant_id': instance.participant_id,
      'amount': instance.amount,
    };
