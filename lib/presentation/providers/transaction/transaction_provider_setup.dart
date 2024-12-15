import 'package:eventpass_app/domain/repositories/transaction/transaction_repository.dart';
import 'package:eventpass_app/domain/usecases/get_transactions/get_transactions_usecase.dart';
import 'package:eventpass_app/domain/usecases/top_up/top_up_usecase.dart';
import 'package:eventpass_app/infrastructure/implementation/transaction/transacion_repository_implementation.dart';
import 'package:eventpass_app/presentation/providers/transaction/transaction_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepositoryImplementation();
});

final topUpUsecaseProvider = Provider<TopUpUsecase>((ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return TopUpUsecase(
    transactionRepository: repository,
  );
});

final getTransactionsProvider = Provider<GetTransactionsUsecase>((ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return GetTransactionsUsecase(
    transactionRepository: repository,
  );
});

final transactionProvider =
    StateNotifierProvider<TransactionNotifier, TransactionState>((ref) {
  final topUpUsecase = ref.watch(topUpUsecaseProvider);
  final getTransactions = ref.watch(getTransactionsProvider);

  return TransactionNotifier(
    topUpUsecase: topUpUsecase,
    getTransactions: getTransactions,
  );
});
