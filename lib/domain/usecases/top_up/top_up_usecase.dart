import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/transaction/transaction.dart';
import 'package:eventpass_app/domain/repositories/transaction/transaction_repository.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class TopUpUsecase implements Usecase<Result<Transaction>, String> {
  final TransactionRepository transactionRepository;

  TopUpUsecase({required this.transactionRepository});

  @override
  Future<Result<Transaction>> call(String params) async {
    try {
      final result = await transactionRepository.topUp(params);

      return result;
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
