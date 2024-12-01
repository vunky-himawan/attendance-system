// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      eventId: json['eventId'] as String,
      eventOrganizer: EventOrganizer.fromJson(
          json['eventOrganizer'] as Map<String, dynamic>),
      thumbnailPath: json['thumbnailPath'] as String,
      title: json['title'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$EventTypeEnumEnumMap, json['type']),
      status: $enumDecode(_$EventStatusEnumEnumMap, json['status']),
      ticketPrice: (json['ticketPrice'] as num).toInt(),
      ticketQuantity: (json['ticketQuantity'] as num).toInt(),
      startDate: DateTime.parse(json['startDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'eventOrganizer': instance.eventOrganizer,
      'thumbnailPath': instance.thumbnailPath,
      'title': instance.title,
      'address': instance.address,
      'description': instance.description,
      'type': _$EventTypeEnumEnumMap[instance.type]!,
      'status': _$EventStatusEnumEnumMap[instance.status]!,
      'ticketPrice': instance.ticketPrice,
      'ticketQuantity': instance.ticketQuantity,
      'startDate': instance.startDate.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$EventTypeEnumEnumMap = {
  EventTypeEnum.SEMINAR: 'SEMINAR',
  EventTypeEnum.KONFERENSI: 'KONFERENSI',
  EventTypeEnum.WORKSHOP: 'WORKSHOP',
  EventTypeEnum.FESTIVAL: 'FESTIVAL',
  EventTypeEnum.LAINNYA: 'LAINNYA',
  EventTypeEnum.EXPO: 'EXPO',
  EventTypeEnum.KONVENSI: 'KONVENSI',
};

const _$EventStatusEnumEnumMap = {
  EventStatusEnum.BUKA: 'BUKA',
  EventStatusEnum.TUTUP: 'TUTUP',
  EventStatusEnum.BERLANGSUNG: 'BERLANGSUNG',
  EventStatusEnum.SELESAI: 'SELESAI',
};
