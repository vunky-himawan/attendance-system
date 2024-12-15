import 'package:eventpass_app/domain/usecases/get_event/get_event_usecase.dart';
import 'package:eventpass_app/presentation/providers/repositories/events_repository/events_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_event.g.dart';

@riverpod
GetEventUsecase getEventUsecase(ref) =>
    GetEventUsecase(eventsRepository: ref.watch(eventsRepositoryProvider));
