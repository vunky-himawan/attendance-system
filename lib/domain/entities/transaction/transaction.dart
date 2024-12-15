import 'package:eventpass_app/domain/entities/enum/status_enum.dart';
import 'package:eventpass_app/domain/entities/enum/transaction_category_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String transactionId,
    required String title,
    required int amount,
    required TransactionCategoryEnum category,
    required StatusEnum status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
