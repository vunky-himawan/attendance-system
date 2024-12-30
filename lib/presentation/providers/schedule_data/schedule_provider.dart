import 'package:eventpass_app/domain/entities/event/event.dart';
import 'package:eventpass_app/domain/usecases/get_participant_upcoming_events/get_participant_upcoming_events_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ScheduleState {
  final String? error;
  final bool isLoading;
  final List<Event>? events;
  final bool isLoadingMore;
  final bool hasMoreData;

  const ScheduleState({
    this.error,
    this.isLoading = false,
    this.events,
    this.isLoadingMore = false,
    this.hasMoreData = true,
  });

  ScheduleState copyWith({
    String? error,
    bool? isLoading,
    List<Event>? events,
    bool? isLoadingMore,
    bool? hasMoreData,
  }) {
    return ScheduleState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      events: events ?? this.events,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMoreData: hasMoreData ?? this.hasMoreData,
    );
  }
}

class ScheduleNotifier extends StateNotifier<ScheduleState> {
  final GetParticipantUpcomingEventsUsecase
      _getParticipantUpcomingEventsUsecase;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  ScheduleNotifier({
    required GetParticipantUpcomingEventsUsecase
        getParticipantUpcomingEventsUsecase,
  })  : _getParticipantUpcomingEventsUsecase =
            getParticipantUpcomingEventsUsecase,
        super(const ScheduleState());

  Future<void> getSchedule() async {
    try {
      state = state.copyWith(isLoading: true);

      final token = await _storage.read(key: 'token');

      final events =
          await _getParticipantUpcomingEventsUsecase.call(token.toString());

      if (events.isSuccess) {
        print('SUCCESS ${events.resultValue}');

        state = state.copyWith(events: events.resultValue);
      } else {
        state = state.copyWith(error: events.errorMessage);
        throw FlutterError('Failed to get schedule');
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
