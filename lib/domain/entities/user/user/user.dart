import 'package:eventpass_app/domain/entities/event_organizer/event_organizer.dart';
import 'package:eventpass_app/domain/entities/participant/participant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String userId,
    required String username,
    String? email,
    required String role,
    String? photoUrl,
    UserDetails? details,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserDetails with _$UserDetails {
  const factory UserDetails.participant({
    required Participant participant,
  }) = ParticipantDetails;

  const factory UserDetails.eventOrganizer({
    required EventOrganizer eventOrganizer,
  }) = EventOrganizerDetails;

  const factory UserDetails.organizationMember({
    required String organizationMemberId,
    required String userId,
    required String eventOrganizerId,
  }) = OrganizationMemberDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}
