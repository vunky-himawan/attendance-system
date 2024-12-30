import 'package:eventpass_app/presentation/pages/participant/jadwal/widget/event_card.dart';
import 'package:eventpass_app/presentation/providers/schedule_data/schedule_provider_setup.dart';
import 'package:eventpass_app/utils/parsed_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JadwalPage extends ConsumerStatefulWidget {
  const JadwalPage({super.key});

  @override
  ConsumerState<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends ConsumerState<JadwalPage> {

  @override
  Widget build(BuildContext context) {
    final scheduleState = ref.watch(scheduleProvider);

    if (scheduleState.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final eventList = scheduleState.events ?? [];

    if (eventList.isEmpty) {
      return const Center(
        child: Text(
          'Belum ada jadwal acara terdaftar.',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

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
            Expanded(
              child: ListView.builder(
                itemCount: eventList.length,
                itemBuilder: (context, index) {
                  final event = eventList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: EventCard(
                      eventId: event.eventId,
                      title: event.title,
                      location: event.address,
                      date: parseDateTime(event.startDate.toString()),
                      imageUrl: event.thumbnailPath,
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
