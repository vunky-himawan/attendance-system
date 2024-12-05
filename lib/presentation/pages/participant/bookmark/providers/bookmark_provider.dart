import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model untuk Bookmark Event
class BookmarkEvent {
  final String title;
  final String location;
  final String date;
  final String imageUrl;

  BookmarkEvent({
    required this.title,
    required this.location,
    required this.date,
    required this.imageUrl,
  });
}

// Provider untuk daftar event bookmark
final bookmarkProvider = StateProvider<List<BookmarkEvent>>((ref) => [
      BookmarkEvent(
        title: 'Party for Big Startups Congratulations',
        location: 'Auditorium Lantai 8 Gedung Sipil',
        date: 'Jumat, 19 Sept 2024',
        imageUrl: 'https://images.pexels.com/photos/691668/pexels-photo-691668.jpeg',
      ),
      BookmarkEvent(
        title: 'Design Thinking Workshop',
        location: 'Online via Zoom',
        date: 'Senin, 22 Sept 2024',
        imageUrl: 'https://images.pexels.com/photos/691668/pexels-photo-691668.jpeg',
      ),
    ]);
