import 'package:eventpass_app/domain/entities/user/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_balance.freezed.dart';
part 'user_balance.g.dart';

@freezed
class UserBalance with _$UserBalance {
  const factory UserBalance({
    required User user,
    required double balance,
  }) = _UserBalance;

  factory UserBalance.fromJson(Map<String, dynamic> json) => _$UserBalanceFromJson(json);
}