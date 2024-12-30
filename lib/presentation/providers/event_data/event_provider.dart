import 'dart:async';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:eventpass_app/domain/entities/event/event.dart';
import 'package:eventpass_app/domain/usecases/get_event/get_event_usecase.dart';
import 'package:eventpass_app/domain/usecases/get_events/get_events_params.dart';
import 'package:eventpass_app/domain/usecases/get_events/get_events_usecase.dart';
import 'package:eventpass_app/domain/usecases/get_participant_upcoming_events/get_participant_upcoming_events_usecase.dart';
import 'package:eventpass_app/domain/usecases/registration_event/registration_event_params.dart';
import 'package:eventpass_app/domain/usecases/registration_event/registration_event_usecase.dart';
import 'package:eventpass_app/main.dart';
import 'package:eventpass_app/presentation/pages/participant/main_page.dart';
import 'package:eventpass_app/presentation/providers/auth/auth_provider_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EventState {
  final String? error;
  final bool isLoading;
  final List<Event>? events;
  final bool isLoadingMore;
  final bool hasMoreData;
  final List<Event>? upcomingEvents;

  const EventState({
    this.upcomingEvents,
    this.error,
    this.isLoading = false,
    this.events,
    this.isLoadingMore = false,
    this.hasMoreData = true,
  });

  EventState copyWith({
    List<Event>? upcomingEvents,
    String? error,
    bool? isLoading,
    List<Event>? events,
    bool? isLoadingMore,
    bool? hasMoreData,
  }) {
    return EventState(
      upcomingEvents: upcomingEvents ?? this.upcomingEvents,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      events: events ?? this.events,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMoreData: hasMoreData ?? this.hasMoreData,
    );
  }
}

class EventNotifier extends StateNotifier<EventState> {
  final GetEventsUsecase _getEventsUsecase;
  final GetEventUsecase _getEventUsecase;
  final RegistrationEventUsecase _registrationEventUsecase;
  final GetParticipantUpcomingEventsUsecase
      _getParticipantUpcomingEventsUsecase;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  EventNotifier({
    required GetEventsUsecase getEventsUsecase,
    required GetEventUsecase getEventUsecase,
    required GetParticipantUpcomingEventsUsecase getParticipantUpcomingEvents,
    required RegistrationEventUsecase registrationEventUsecase,
  })  : _getEventsUsecase = getEventsUsecase,
        _getParticipantUpcomingEventsUsecase = getParticipantUpcomingEvents,
        _registrationEventUsecase = registrationEventUsecase,
        _getEventUsecase = getEventUsecase,
        super(const EventState());

  Future<void> getEvents({
    required String page,
    required String size,
    bool? isLoadMore,
  }) async {
    try {
      if (isLoadMore != null && isLoadMore) {
        state = state.copyWith(isLoadingMore: isLoadMore);
      } else {
        state = state.copyWith(isLoading: true);
      }

      final events = await _getEventsUsecase.call(
        GetEventsParams(page: page, size: size),
      );

      if (events.isSuccess) {
        state = state.copyWith(
          events: events.resultValue,
          hasMoreData: events.resultValue?.isNotEmpty ?? false,
        );
      } else {
        state = state.copyWith(error: events.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      if (isLoadMore != null && isLoadMore) {
        state = state.copyWith(isLoadingMore: false);
      } else {
        state = state.copyWith(isLoading: false);
      }
    }
  }

  Future<Event> getEvent({required String eventId}) async {
    try {
      state = state.copyWith(isLoading: true);

      final result = await _getEventUsecase.call(eventId);

      if (result.isSuccess) {
        return result.resultValue!;
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              result.errorMessage!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
        throw FlutterError('Failed to get event');
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> registrationEvent(
      {required String eventId, required WidgetRef ref}) async {
    try {
      state = state.copyWith(isLoading: true);

      final authState = ref.read(authProvider);

      final participant = authState.participant!;

      final params = RegistrationEventParams(
        eventId: eventId,
        participantId: participant.participantId!,
      );

      final result = await _registrationEventUsecase.call(params);

      if (result.isSuccess) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Pembelian telah berhasil',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );

        Navigator.pushAndRemoveUntil(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const ParticipantMainPage(),
          ),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              result.errorMessage!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getParticipantUpcomingEvents() async {
    try {
      state = state.copyWith(isLoading: true);

      final token = await _secureStorage.read(key: 'token');

      if (token == null || token.isEmpty) {
        throw FlutterError('Token not found.');
      }

      final result = await _getParticipantUpcomingEventsUsecase.call(token);

      print('result.resultValue! ${result.resultValue}');

      if (result.isSuccess) {
        state = state.copyWith(upcomingEvents: result.resultValue!);
      } else {
        state = state.copyWith(error: result.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
