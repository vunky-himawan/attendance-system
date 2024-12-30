import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model untuk Event
class Event {
  final String imageUrl;
  final String title;
  final String location;
  int rating; // Rating yang dapat berubah

  Event({
    required this.imageUrl,
    required this.title,
    required this.location,
    this.rating = 0, // Default rating adalah 0
  });
}

// StateNotifier untuk mengelola daftar event
class EventNotifier extends StateNotifier<List<Event>> {
  EventNotifier()
      : super([
          // Data awal untuk event
          Event(
            imageUrl:
                'https://images.unsplash.com/photo-1519677100203-a0e668c92439?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80',
            title: 'Party for Big Startups Congratulations',
            location: 'Auditorium Lantai 8 Gedung Sipil',
          ),
          Event(
            imageUrl:
                'https://images.unsplash.com/photo-1519677100203-a0e668c92439?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80',
            title: 'Another Great Event',
            location: 'Gedung Serbaguna',
            rating: 5, // Sudah diberi rating penuh
          ),
        ]);

  // Update rating untuk event tertentu
  void updateRating(int index, int rating) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Event(
            imageUrl: state[i].imageUrl,
            title: state[i].title,
            location: state[i].location,
            rating: rating,
          )
        else
          state[i],
    ];
  }
}

// Provider untuk daftar event
final eventProvider = StateNotifierProvider<EventNotifier, List<Event>>(
  (ref) => EventNotifier(),
);