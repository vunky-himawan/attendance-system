import 'package:dio/dio.dart';
import 'package:eventpass_app/domain/entities/enum/event_status_enum.dart';
import 'package:eventpass_app/domain/entities/enum/event_type_enum.dart';
import 'package:eventpass_app/domain/entities/event/event.dart';
import 'package:eventpass_app/domain/entities/event_organizer/event_organizer.dart';
import 'package:eventpass_app/domain/entities/result/result.dart';
import 'package:eventpass_app/domain/entities/speaker/speaker.dart';
import 'package:eventpass_app/domain/entities/ticket/ticket.dart';
import 'package:eventpass_app/domain/repositories/events/events_repository.dart';
import 'package:eventpass_app/infrastructure/config/api_client.dart';
import 'package:eventpass_app/infrastructure/config/app_config.dart';

class EventsRepositoryImplementation implements EventsRepository {
  final Dio? _dio;
  final ApiClient _apiClient = ApiClient();

  EventsRepositoryImplementation({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<Event>> getEvent(String eventId) async {
    try {
      final response = await _dio!.get(
        '${AppConfig.apiBaseUrl}/event/$eventId',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      final eventOrganizer = EventOrganizer(
        eventOrganizerId: response.data['data']['event_organizer']
            ['event_organizer_id'],
        address: response.data['data']['event_organizer']['address'],
        email: response.data['data']['event_organizer']['email'],
        description: response.data['data']['event_organizer']['description'],
        organizationName: response.data['data']['event_organizer']
            ['organization_name'],
        phoneNumber: response.data['data']['event_organizer']['phone_number'],
        amount: response.data['data']['event_organizer']['amount'],
      );

      final eventSpeakers = response.data['data']['event_speakers'];

      final List<Speaker> speakers = [];

      for (var speaker in eventSpeakers) {
        final speakerData = speaker['speaker'];

        final speakerEntity = Speaker(
          speakerId: speakerData['speaker_id'],
          name: speakerData['name'],
          title: speakerData['title'],
          socialMediaLink: speakerData['social_media_link'] ?? '',
          company: speakerData['company'],
        );

        speakers.add(speakerEntity);
      }

      final event = Event(
          eventId: response.data['data']['event_id'],
          eventOrganizer: eventOrganizer,
          thumbnailPath: response.data['data']['thumbnail_path'],
          title: response.data['data']['title'],
          address: response.data['data']['address'],
          description: response.data['data']['description'],
          type: EventTypeEnum.values
              .firstWhere((type) => type.name == response.data['data']['type']),
          status: EventStatusEnum.values.firstWhere(
              (status) => status.name == response.data['data']['status']),
          ticketPrice: response.data['data']['ticket_price'],
          ticketQuantity: response.data['data']['ticket_quantity'],
          startDate: DateTime.parse(response.data['data']['start_date']),
          speakers: speakers);

      return Result.success(event);
    } on DioException catch (e) {
      return Result.failed(e.toString());
    } catch (e) {
      return const Result.failed('Unexpected error occurred');
    }
  }

  @override
  Future<Result<List<Event>>> getEvents(String page, String size) async {
    try {
      final response = await _dio!.get(
        '${AppConfig.apiBaseUrl}/event?page=$page&page_size=$size',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      final events = response.data['data']['events'] as List;

      final List<Event> eventsList = [];

      for (var event in events) {
        final eventOrganizerData = event['event_organizer'];

        final eventOrganizer = EventOrganizer(
          eventOrganizerId: eventOrganizerData['event_organizer_id'],
          address: eventOrganizerData['address'],
          email: eventOrganizerData['email'],
          description: eventOrganizerData['description'],
          organizationName: eventOrganizerData['organization_name'],
          phoneNumber: eventOrganizerData['phone_number'],
          amount: eventOrganizerData['amount'],
        );

        final eventSpeakers = event['event_speakers'] as List;

        final List<Speaker> speakers = eventSpeakers
            .map((speakerData) {
              final speaker = speakerData['speaker'];

              final Speaker speakerEntity = Speaker(
                speakerId: speaker['speaker_id'],
                name: speaker['name'],
                title: speaker['title'],
                socialMediaLink: speaker['social_media_links'],
                company: speaker['company'],
              );

              return speakerEntity;
            })
            .whereType<Speaker>()
            .toList();

        final eventEntity = Event(
          eventId: event['event_id'],
          eventOrganizer: eventOrganizer,
          thumbnailPath: event['thumbnail_path'],
          title: event['title'],
          address: event['address'],
          description: event['description'],
          type: EventTypeEnum.values.firstWhere(
            (type) => type.name == event['type'],
          ),
          status: EventStatusEnum.values.firstWhere(
            (status) => status.name == event['status'],
          ),
          ticketPrice: event['ticket_price'],
          ticketQuantity: event['ticket_quantity'],
          startDate: DateTime.parse(event['start_date']),
          speakers: speakers,
        );

        eventsList.add(eventEntity);
      }

      return Result.success(eventsList);
    } on DioException catch (e) {
      return Result.failed(e.toString());
    } catch (e) {
      return const Result.failed('Unexpected error occurred');
    }
  }

  @override
  Future<Result<Ticket>> registrationEvent(
      String eventId, String participantId) async {
    try {
      final response = await _dio!.post(
        '${AppConfig.apiBaseUrl}/event/$eventId/registration',
        data: {'participant_id': participantId},
        options: Options(headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        }),
      );

      final responseData = response.data['data'];

      final ticket = Ticket(
        ticketId: responseData['ticket_id'],
        eventId: eventId,
        transactionId: responseData['transaction_id'],
        pin: responseData['pin'],
      );

      return Result.success(ticket);
    } on DioException catch (e) {
      return Result.failed(e.toString());
    } catch (e) {
      return const Result.failed('Unexpected error occurred');
    }
  }

  @override
  Future<Result<List<Event>>> getParticipantUpcomingEvents(
      String token, String page, String size) async {
    try {
      final response = await _apiClient.dio.get(
        '${AppConfig.apiBaseUrl}/event/participant/upcoming?page=$page&page_size=$size',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.data['status'] == 'error') {
        return Result.failed(response.data['detail']);
      }

      final responseData = response.data['data'];

      final events = responseData['items'] as List;

      final List<Event> eventsList = [];

      for (var event in events) {
        final eventEntity = Event(
          eventId: event['event_id'],
          address: event['address'],
          description: event['description'],
          thumbnailPath: event['thumbnail_path'],
          title: event['title'],
          type: EventTypeEnum.values.firstWhere(
            (type) => type.name == event['type'],
          ),
          status: EventStatusEnum.values.firstWhere(
            (status) => status.name == event['status'],
          ),
          ticketPrice: event['ticket_price'],
          ticketQuantity: event['ticket_quantity'],
          startDate: DateTime.parse(event['start_date']),
        );

        eventsList.add(eventEntity);
      }

      return Result.success(eventsList);
    } on DioException catch (e) {
      return Result.failed(e.toString());
    } catch (e) {
      return const Result.failed('Unexpected error occurred');
    }
  }
}
