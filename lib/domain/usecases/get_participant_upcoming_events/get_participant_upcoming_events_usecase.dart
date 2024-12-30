import 'package:eventpass_app/domain/entities/event/event.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/repositories/events/events_repository.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class GetParticipantUpcomingEventsUsecase
    implements Usecase<Result<List<Event>>, String> {
  final EventsRepository eventsRepository;

  GetParticipantUpcomingEventsUsecase({required this.eventsRepository});

  @override
  Future<Result<List<Event>>> call(String token) async {
    try {
      final events =
          await eventsRepository.getParticipantUpcomingEvents(token, '1', '10');

      if (events.isFailed) {
        return const Result.success([]);
      }

      final List<Event> listEvent = events.resultValue!;

      return Result.success(listEvent);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
