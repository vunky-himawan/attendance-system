import 'package:eventpass_app/domain/entities/enum/event_status_enum.dart';
import 'package:eventpass_app/domain/entities/enum/event_type_enum.dart';
import 'package:eventpass_app/domain/entities/event_organizer/event_organizer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String eventId,
    required EventOrganizer eventOrganizer,
    required String thumbnailPath,
    required String title,
    required String address,
    required String description,
    required EventTypeEnum type,
    required EventStatusEnum status,
    required int ticketPrice,
    required int ticketQuantity,
    required DateTime startDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
