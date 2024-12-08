import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class SearchResultsWidget extends StatelessWidget {
  final List<Map<String, String>> searchResults;

  const SearchResultsWidget({
    Key? key,
    required this.searchResults,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (searchResults.isEmpty)
          const Center(
            child: Column(
              children: [
                HeroIcon(
                  HeroIcons.magnifyingGlass,
                  size: 40,
                  color: Colors.black,
                ),
                SizedBox(height: 8),
                Text(
                  "Tidak ada acara yang ditemukan.",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          )
        else
          Column(
            children: searchResults.map((result) {
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      result['imagePath'] ?? '', // URL gambar
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, color: Colors.grey);
                      },
                    ),
                  ),
                  title: Text(
                    result['title'] ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const HeroIcon(HeroIcons.mapPin, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            "${result['location'] ?? 'Tidak diketahui'}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0300A2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Gratis',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
