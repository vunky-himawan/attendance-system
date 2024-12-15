import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/ticket/ticket.dart';

abstract interface class TicketRepository {
  Future<Result<Map<String, dynamic>>> getTicket(String token, String eventId);
}
