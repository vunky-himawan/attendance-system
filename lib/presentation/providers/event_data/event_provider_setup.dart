import 'package:eventpass_app/domain/repositories/events/events_repository.dart';
import 'package:eventpass_app/domain/usecases/get_event/get_event_usecase.dart';
import 'package:eventpass_app/domain/usecases/get_events/get_events_usecase.dart';
import 'package:eventpass_app/domain/usecases/get_participant_upcoming_events/get_participant_upcoming_events_usecase.dart';
import 'package:eventpass_app/domain/usecases/registration_event/registration_event_usecase.dart';
import 'package:eventpass_app/infrastructure/implementation/events/events_repository_implementation.dart';
import 'package:eventpass_app/presentation/providers/event_data/event_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventRepositoryProvider = Provider<EventsRepository>((ref) {
  return EventsRepositoryImplementation();
});

final getEventsUsecaseProvider = Provider<GetEventsUsecase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetEventsUsecase(eventsRepository: repository);
});

final getEventUsecaseProvider = Provider<GetEventUsecase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetEventUsecase(eventsRepository: repository);
});

final registrationEventUsecaseProvider =
    Provider<RegistrationEventUsecase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return RegistrationEventUsecase(eventsRepository: repository);
});

final getParticipantUpcomingEventsUsecaseProvider =
    Provider<GetParticipantUpcomingEventsUsecase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetParticipantUpcomingEventsUsecase(eventsRepository: repository);
});

final eventProvider = StateNotifierProvider<EventNotifier, EventState>((ref) {
  final getEventsUsecase = ref.watch(getEventsUsecaseProvider);
  final getEventUsecase = ref.watch(getEventUsecaseProvider);
  final registrationEventUsecase = ref.watch(registrationEventUsecaseProvider);
  final getParticipantUpcomingEvents =
      ref.watch(getParticipantUpcomingEventsUsecaseProvider);

  return EventNotifier(
    getEventsUsecase: getEventsUsecase,
    getParticipantUpcomingEvents: getParticipantUpcomingEvents,
    getEventUsecase: getEventUsecase,
    registrationEventUsecase: registrationEventUsecase,
  );
});
