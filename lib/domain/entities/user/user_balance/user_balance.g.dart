// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBalanceImpl _$$UserBalanceImplFromJson(Map<String, dynamic> json) =>
    _$UserBalanceImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$$UserBalanceImplToJson(_$UserBalanceImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'balance': instance.balance,
    };
