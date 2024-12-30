import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaker.freezed.dart';
part 'speaker.g.dart';

@freezed
class Speaker with _$Speaker {
  const factory Speaker({
    required String speakerId,
    required String name,
    required String title,
    required String socialMediaLink,
    required String company,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Speaker;

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);
}
