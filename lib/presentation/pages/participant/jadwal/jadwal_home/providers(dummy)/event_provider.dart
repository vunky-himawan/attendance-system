import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider untuk daftar event
final eventListProvider = StateProvider<List<Map<String, String>>>((ref) => [
      {
        'title': 'Party for Big Startups Congratulations',
        'location': 'Auditorium Lantai 8 Gedung Sipil',
        'date': 'In 2 Days',
        'imageUrl': 'https://images.pexels.com/photos/691668/pexels-photo-691668.jpeg'
      },
      {
        'title': 'Design Thinking Work With Go',
        'location': 'Online via Zoom',
        'date': 'Tomorrow',
        'imageUrl': 'https://images.pexels.com/photos/691668/pexels-photo-691668.jpeg'
      },
    ]);
