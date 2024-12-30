import 'package:eventpass_app/domain/repositories/events/events_repository.dart';
import 'package:eventpass_app/infrastructure/implementation/events/events_repository_implementation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'events_repository.g.dart';

@riverpod
EventsRepository eventsRepository(ref) => EventsRepositoryImplementation();
