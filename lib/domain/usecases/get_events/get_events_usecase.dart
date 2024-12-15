import 'package:eventpass_app/domain/entities/event/event.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/repositories/events/events_repository.dart';
import 'package:eventpass_app/domain/usecases/get_events/get_events_params.dart';
import 'package:eventpass_app/domain/usecases/usecase.dart';

class GetEventsUsecase
    implements Usecase<Result<List<Event>>, GetEventsParams> {
  final EventsRepository eventsRepository;

  GetEventsUsecase({required this.eventsRepository});

  @override
  Future<Result<List<Event>>> call(GetEventsParams params) async {
    try {
      final events =
          await eventsRepository.getEvents(params.page!, params.size!);

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
