import 'package:flutter/material.dart';

class SpeakerRow extends StatelessWidget {
  const SpeakerRow({super.key});

  // Daftar pembicara didefinisikan langsung di dalam widget
  List<Speaker> get speakers => [
        Speaker(
          name: "Ina Kio",
          role: "Copywriter",
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Speaker(
          name: "Shaji",
          role: "Designer",
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Speaker(
          name: "Alex",
          role: "Developer",
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Speaker(
          name: "Maria",
          role: "CEO",
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Tinggi maksimum untuk card pembicara
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: speakers.length,
        itemBuilder: (context, index) {
          final speaker = speakers[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16), // Jarak antar card
            child: _SpeakerCard(
              name: speaker.name,
              role: speaker.role,
              imageUrl: speaker.imageUrl,
            ),
          );
        },
      ),
    );
  }
}

class _SpeakerCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const _SpeakerCard({
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Lebar setiap card
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Speaker {
  final String name;
  final String role;
  final String imageUrl;

  Speaker({required this.name, required this.role, required this.imageUrl});
}
