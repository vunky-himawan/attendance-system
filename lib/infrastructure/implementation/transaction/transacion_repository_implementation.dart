import 'package:dio/dio.dart';
import 'package:eventpass_app/domain/entities/enum/status_enum.dart';
import 'package:eventpass_app/domain/entities/enum/transaction_category_enum.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/transaction/transaction.dart';
import 'package:eventpass_app/domain/repositories/transaction/transaction_repository.dart';
import 'package:eventpass_app/infrastructure/config/api_client.dart';
import 'package:eventpass_app/infrastructure/config/app_config.dart';

class TransactionRepositoryImplementation implements TransactionRepository {
  final ApiClient _apiClient = ApiClient();

  @override
  Future<Result<List<Transaction>>> getTransactions(String token) async {
    try {
      final response = await _apiClient.dio.get(
        '${AppConfig.apiBaseUrl}/transactions',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      // Check for valid response and data
      if (response.statusCode != 200 || response.data == null) {
        return const Result.failed(
            'Failed to fetch transactions: Invalid response.');
      }

      final String? status = response.data['status'];
      final String? detail = response.data['detail'];

      if (status == 'error') {
        return Result.failed(detail ?? 'Unknown error occurred.');
      }

      final List<dynamic>? data = response.data['data'];

      // If data is null or empty
      if (data == null || data.isEmpty) {
        return const Result.success([]);
      }

      final List<Transaction> transactions = [];

      for (var t in data) {
        try {
          final transaction = Transaction(
            category: TransactionCategoryEnum.values.firstWhere(
                (category) => category.name == t['category'],
                orElse: () => TransactionCategoryEnum.TICKET),
            title: t['title'],
            transactionId: t['transaction_id'],
            amount: t['amount'],
            status: StatusEnum.values.firstWhere(
                (status) => status.name == t['status'],
                orElse: () => StatusEnum.BERHASIL),
            createdAt: DateTime.parse(t['created_at']),
          );
          transactions.add(transaction);
        } catch (e) {
          // Handle any parsing issues
          return Result.failed('Error parsing transaction: ${e.toString()}');
        }
      }

      return Result.success(transactions);
    } catch (e) {
      return Result.failed('Failed to fetch transactions: ${e.toString()}');
    }
  }

  @override
  Future<Result<Transaction>> topUp(String token) async {
    try {
      final response = await _apiClient.dio
          .post('${AppConfig.apiBaseUrl}/transactions/top-up',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                  'Content-Type': 'application/json',
                },
              ));

      // Check for error in response
      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      // Parse the response data for the top-up transaction
      final transaction = Transaction(
        category: TransactionCategoryEnum.values.firstWhere(
            (category) => category.name == response.data['data']['category']),
        title: response.data['data']['title'],
        transactionId: response.data['data']['transaction_id'],
        amount: response.data['data']['amount'],
        status: StatusEnum.values.firstWhere(
            (status) => status.name == response.data['data']['status']),
        createdAt: DateTime.parse(response.data['data']['created_at']),
      );

      return Result.success(transaction);
    } catch (e) {
      return Result.failed('Failed to top-up: ${e.toString()}');
    }
  }
}
