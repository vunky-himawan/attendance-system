import 'package:eventpass_app/domain/entities/event/event.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/repositories/events/events_repository.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class GetEventUsecase implements Usecase<Result<Event>, String> {
  final EventsRepository eventsRepository;

  GetEventUsecase({required this.eventsRepository});

  @override
  Future<Result<Event>> call(String eventId) async {
    try {
      final event = await eventsRepository.getEvent(eventId);

      if (event.isFailed) {
        return const Result.failed('Event not found');
      }

      return Result.success(event.resultValue!);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
