// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      transactionId: json['transactionId'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toInt(),
      category: $enumDecode(_$TransactionCategoryEnumEnumMap, json['category']),
      status: $enumDecode(_$StatusEnumEnumMap, json['status']),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'title': instance.title,
      'amount': instance.amount,
      'category': _$TransactionCategoryEnumEnumMap[instance.category]!,
      'status': _$StatusEnumEnumMap[instance.status]!,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$TransactionCategoryEnumEnumMap = {
  TransactionCategoryEnum.TICKET: 'TICKET',
  TransactionCategoryEnum.TOP_UP: 'TOP_UP',
};

const _$StatusEnumEnumMap = {
  StatusEnum.BERHASIL: 'BERHASIL',
  StatusEnum.GAGAL: 'GAGAL',
};
