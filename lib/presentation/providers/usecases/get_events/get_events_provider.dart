import 'package:eventpass_app/domain/usecases/get_events/get_events_usecase.dart';
import 'package:eventpass_app/presentation/providers/repositories/events_repository/events_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_events_provider.g.dart';

@riverpod
GetEventsUsecase getEventsUsecase(ref) =>
    GetEventsUsecase(eventsRepository: ref.watch(eventsRepositoryProvider));
