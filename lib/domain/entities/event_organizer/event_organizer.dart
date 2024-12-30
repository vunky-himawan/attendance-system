import 'package:eventpass_app/domain/entities/speaker/speaker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_organizer.freezed.dart';
part 'event_organizer.g.dart';

@freezed
class EventOrganizer with _$EventOrganizer {
  const factory EventOrganizer({
    required String email,
    required String phoneNumber,
    required String organizationName,
    required String address,
    required String description,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? eventOrganizerId,
    @Default(0) int amount,
  }) = _EventOrganizer;

  factory EventOrganizer.fromJson(Map<String, dynamic> json) =>
      _$EventOrganizerFromJson(json);
}
