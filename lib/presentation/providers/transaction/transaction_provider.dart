import 'package:eventpass_app/domain/entities/transaction/transaction.dart';
import 'package:eventpass_app/domain/usecases/get_transactions/get_transactions_usecase.dart';
import 'package:eventpass_app/domain/usecases/top_up/top_up_usecase.dart';
import 'package:eventpass_app/presentation/providers/auth/auth_provider_setup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TransactionState {
  final String? error;
  final bool isLoading;
  final List<Transaction>? transactions;

  const TransactionState({
    this.error,
    this.isLoading = false,
    this.transactions,
  });

  TransactionState copyWith({
    String? error,
    bool? isLoading,
    List<Transaction>? transactions,
  }) {
    return TransactionState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      transactions: transactions ?? this.transactions,
    );
  }
}

class TransactionNotifier extends StateNotifier<TransactionState> {
  final TopUpUsecase _topUpUsecase;
  final GetTransactionsUsecase _getTransactionsUsecase;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  TransactionNotifier({
    required TopUpUsecase topUpUsecase,
    required GetTransactionsUsecase getTransactions,
  })  : _topUpUsecase = topUpUsecase,
        _getTransactionsUsecase = getTransactions,
        super(const TransactionState());

  Future<void> getTransactions() async {
    try {
      state = state.copyWith(isLoading: true);

      final token = await _secureStorage.read(key: 'token');

      if (token == null || token.isEmpty) {
        throw Exception('Token is missing. Please log in again.');
      }

      final result = await _getTransactionsUsecase(token);

      final List<Transaction> oldTransactions = state.transactions ?? [];

      if (result.isSuccess) {
        state = state.copyWith(
          transactions: [...oldTransactions, ...(result.resultValue! ?? [])],
        );
      } else {
        state = state.copyWith(error: result.errorMessage);
      }
    } catch (error) {
      state = state.copyWith(error: error.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> topUp({required WidgetRef ref}) async {
    try {
      state = state.copyWith(isLoading: true);

      final userState = ref.read(authProvider);
      final token = await _secureStorage.read(key: 'token');

      if (token == null || token.isEmpty) {
        throw Exception('Token is missing. Please log in again.');
      }

      final result = await _topUpUsecase(token);

      if (result.isSuccess) {
        if (userState.user?.role == 'PARTICIPANT' &&
            userState.participant != null) {
          final updatedParticipant = userState.participant!.copyWith(
            amount: userState.participant!.amount + result.resultValue!.amount,
          );
          ref.read(authProvider.notifier).updateParticipant(updatedParticipant);
        } else if (userState.user?.role == 'EVENT_ORGANIZER' &&
            userState.eventOrganizer != null) {
          final updatedEventOrganizer = userState.eventOrganizer!.copyWith(
            amount:
                userState.eventOrganizer!.amount + result.resultValue!.amount,
          );
          ref
              .read(authProvider.notifier)
              .updateEventOrganizer(updatedEventOrganizer);
        }

        final List<Transaction> oldTransaction = state.transactions ?? [];

        state = state.copyWith(
          transactions: [
            result.resultValue!,
            ...oldTransaction,
          ],
        );
      } else {
        state = state.copyWith(error: result.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(error: 'An error occurred: $e');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
