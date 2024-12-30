import 'package:eventpass_app/domain/repositories/events/events_repository.dart';
import 'package:eventpass_app/domain/usecases/get_participant_upcoming_events/get_participant_upcoming_events_usecase.dart';
import 'package:eventpass_app/infrastructure/implementation/events/events_repository_implementation.dart';
import 'package:eventpass_app/presentation/providers/schedule_data/schedule_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  return EventsRepositoryImplementation();
});

final getParticipantUpcomingEventsUsecaseProvider =
    Provider<GetParticipantUpcomingEventsUsecase>((ref) {
  final repository = ref.watch(eventsRepositoryProvider);
  return GetParticipantUpcomingEventsUsecase(
    eventsRepository: repository,
  );
});

final scheduleProvider =
    StateNotifierProvider<ScheduleNotifier, ScheduleState>((ref) {
  final getParticipantUpcomingEventsUsecase =
      ref.watch(getParticipantUpcomingEventsUsecaseProvider);

  return ScheduleNotifier(
    getParticipantUpcomingEventsUsecase: getParticipantUpcomingEventsUsecase,
  );
});
