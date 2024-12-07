import 'package:eventpass_app/presentation/pages/participant/history/widget/event_card.dart';
import 'package:eventpass_app/presentation/pages/participant/history/widget/rating_bottom_sheet.dart';
import 'package:eventpass_app/presentation/pages/participant/history/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Riwayat Kunjungan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return Column(
              children: [
                EventCard(
                  imageUrl: event.imageUrl,
                  title: event.title,
                  location: event.location,
                  rating: event.rating,
                  onTap: event.rating == 0
                      ? () {
                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            builder: (context) {
                              return RatingBottomSheet(
                                ref: ref,
                                index: index,
                                onRatingUpdated: () => Navigator.pop(context),
                              );
                            },
                          );
                        }
                      : null,
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
