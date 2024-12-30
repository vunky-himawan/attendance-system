import 'package:eventpass_app/presentation/pages/participant/bookmark/providers/bookmark_provider.dart';
import 'package:flutter/material.dart';

class BookmarkCard extends StatelessWidget {
  final BookmarkEvent event;

  const BookmarkCard({super.key, 
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Acara
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              event.imageUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul Acara
                Text(
                  event.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Lokasi Acara
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 16, color: Colors.grey.shade700),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        event.location,
                        style: TextStyle(color: Colors.grey.shade700),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Tanggal Acara
                Text(
                  event.date,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
