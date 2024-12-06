import 'package:eventpass_app/presentation/pages/participant/history/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ambil daftar event dari provider
    final events = ref.watch(eventProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Riwayat Kunjungan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
                  onTap: event.rating == 0 // Jika belum diberi rating
                      ? () {
                          showRatingBottomSheet(context, ref, index);
                        }
                      : null,
                ),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }

  void showRatingBottomSheet(BuildContext context, WidgetRef ref, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Nilai Pengalaman Anda',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  5,
                  (rating) => GestureDetector(
                    onTap: () {
                      ref.read(eventProvider.notifier).updateRating(index, rating + 1);
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.star,
                      size: 36,
                      color: rating < ref.watch(eventProvider)[index].rating
                          ? Colors.orange
                          : Colors.grey[300],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kirim'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final int rating;
  final VoidCallback? onTap;

  EventCard({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text(
                        location,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: index < rating
                            ? Colors.orange
                            : Colors.grey[300],
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
