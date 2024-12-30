import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/transaction/transaction.dart';
import 'package:eventpass_app/domain/repositories/transaction/transaction_repository.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class GetTransactionsUsecase
    implements Usecase<Result<List<Transaction>>, String> {
  final TransactionRepository transactionRepository;

  GetTransactionsUsecase({required this.transactionRepository});

  @override
  Future<Result<List<Transaction>>> call(String token) async {
    try {
      final result = await transactionRepository.getTransactions(token);

      return result;
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
