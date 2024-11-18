import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/user/user/user.dart';

abstract interface class UserBalanceRepository {
  Future<Result<double>> getUserBalance({required String user_id});
  Future<Result<User>> updateUserBalance({required User user, required double balance});
}