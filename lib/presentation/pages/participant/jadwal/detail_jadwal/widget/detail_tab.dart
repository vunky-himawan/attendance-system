import 'package:flutter/material.dart';
import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/providers/detail_jadwal_provider.dart';
import 'package:heroicons/heroicons.dart';

class DetailTab extends StatelessWidget {
  final EventDetail event;

  const DetailTab({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(event.date),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              event.title,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const HeroIcon(HeroIcons.mapPin, color: Colors.black),
                const SizedBox(width: 8),
                Text(event.location),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                ...List.generate(
                    event.rating.round(),
                    (index) => const Icon(Icons.star, color: Colors.orange)),
                ...List.generate(
                    5 - event.rating.round(),
                    (index) => const Icon(Icons.star_border, color: Colors.orange)),
                const SizedBox(width: 8),
                Text("${event.rating}/5 (${event.ratingCount})"),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Tentang",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              event.about,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const Text(
              "Tentang",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              event.about,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
