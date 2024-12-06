import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider untuk menyimpan tab index
final selectedTabProvider = StateProvider<int>((ref) => 0);

// StateNotifierProvider untuk menyimpan data detail acara
final eventDetailProvider = Provider<EventDetail>((ref) {
  return EventDetail(
    title: "Party for Big Startups Congratulations",
    location: "Auditorium Lantai 8 Gedung Sipil",
    date: "Sabtu, 19 Oktober 2024 | 06:00 PM - 12:00 AM",
    about:
        "Pesta ini akan menjadi niat baik kami untuk menghubungkan para pendiri startup lainnya dan mengembangkan bisnis bersama sehingga negara kita menjadi lebih baik di masa depan.",
    imageUrl: 'https://images.pexels.com/photos/236589/pexels-photo-236589.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    rating: 4.5,
    ratingCount: 11390,
  );
});

// Model untuk menyimpan data acara
class EventDetail {
  final String title;
  final String location;
  final String date;
  final String about;
  final String imageUrl;
  final double rating;
  final int ratingCount;

  EventDetail({
    required this.title,
    required this.location,
    required this.date,
    required this.about,
    required this.imageUrl,
    required this.rating,
    required this.ratingCount,
  });
}
