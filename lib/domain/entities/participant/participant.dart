import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant.freezed.dart';
part 'participant.g.dart';

@freezed
class Participant with _$Participant {
  const factory Participant({
    required String participant_name,
    required int age,
    required String gender,
    required String birth_date,
    required DateTime created_at,
    required DateTime updated_at,
    String? participant_id,
    @Default(0) int amount,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) => _$ParticipantFromJson(json);
}