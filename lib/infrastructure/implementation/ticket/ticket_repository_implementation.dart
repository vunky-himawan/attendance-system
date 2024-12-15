import 'package:dio/dio.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/ticket/ticket.dart';
import 'package:eventpass_app/domain/repositories/ticket/ticket_repository.dart';
import 'package:eventpass_app/infrastructure/config/api_client.dart';
import 'package:eventpass_app/infrastructure/config/app_config.dart';

class TicketRepositoryImplementation implements TicketRepository {
  final ApiClient _apiClient = ApiClient();

  @override
  Future<Result<Map<String, dynamic>>> getTicket(
      String token, String eventId) async {
    try {
      final response = await _apiClient.dio.get(
        '${AppConfig.apiBaseUrl}/event/check-is-purchased/$eventId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      return Result.success(response.data['data']);
    } on DioException catch (e) {
      return Result.failed(e.toString());
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
