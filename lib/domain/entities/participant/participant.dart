import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant.freezed.dart';
part 'participant.g.dart';

@freezed
class Participant with _$Participant {
  const factory Participant({
    required String participantName,
    required int age,
    required String gender,
    required String birthDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? participantId,
    @Default(0) int amount,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}
