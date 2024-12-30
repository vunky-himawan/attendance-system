import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/transaction/transaction.dart';

abstract interface class TransactionRepository {
  Future<Result<List<Transaction>>> getTransactions(String token);
  Future<Result<Transaction>> topUp(String token);
}
