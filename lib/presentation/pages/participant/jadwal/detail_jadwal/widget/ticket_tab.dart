import 'package:flutter/material.dart';
import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/providers/detail_jadwal_provider.dart';

class TicketTab extends StatelessWidget {
  final EventDetail event;

  const TicketTab({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade900),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(color: Colors.grey),
                _buildTicketInfo("Tempat", event.location),
                _buildTicketInfo("Waktu", event.date),
                _buildTicketInfo("Harga Tiket", "Rp. 20.000"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTicketInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
