import 'package:eventpass_app/domain/entities/event/event.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/ticket/ticket.dart';

abstract interface class EventsRepository {
  Future<Result<List<Event>>> getEvents(String page, String size);
  Future<Result<Event>> getEvent(String eventId);
  Future<Result<Ticket>> registrationEvent(
      String eventId, String participantId);
  Future<Result<List<Event>>> getParticipantUpcomingEvents(
      String token, String page, String size);
}
