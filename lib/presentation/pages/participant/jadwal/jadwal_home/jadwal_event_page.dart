import 'package:eventpass_app/presentation/pages/participant/jadwal/jadwal_home/providers(dummy)/event_provider.dart';
import 'package:eventpass_app/presentation/pages/participant/jadwal/jadwal_home/widget/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class JadwalPage extends ConsumerWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mengambil data event dari provider
    final eventList = ref.watch(eventListProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 110.0, 16.0, 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jadwal Anda',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            // Cek jika event kosong
            if (eventList.isEmpty)
              const Center(
                child: Text(
                  'Belum ada jadwal acara terdaftar.',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: eventList.length,
                  itemBuilder: (context, index) {
                    final event = eventList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: EventCard(
                        title: event['title'] ?? '',
                        location: event['location'] ?? '',
                        date: event['date'] ?? '',
                        imageUrl: event['imageUrl'] ?? '',
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
