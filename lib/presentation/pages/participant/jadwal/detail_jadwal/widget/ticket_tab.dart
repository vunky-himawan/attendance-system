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
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.shade900, width: 1.5),
            color: Colors.white,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Ticket info rata kiri
              children: [
                // Title (Judul Acara)
                Center(
                  child: Text(
                    "Party for Big Startups\nCongratulations",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),

                // Big Ticket Number (Nomor Tiket Besar)
                Center(
                  child: Text(
                    "888 888",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Invoice ID (ID Invoice)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Invoice ID",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "I-8910283",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.grey),
                const SizedBox(height: 8),

                // Ticket Info
                _buildTicketInfo("Tempat", "Graha Politeknik Negeri Malang"),
                const SizedBox(height: 8),
                _buildTicketInfo("Waktu", "Kamis, 20 Oktober 2024 | 08.00 PM"),
                const SizedBox(height: 8),
                _buildTicketInfo("Harga Tiket", "Rp. 20.000"),
                const SizedBox(height: 8),
                _buildTicketInfo(
                    "Tanggal Pembelian", "Kamis, 20 Oktober 2024 | 10.00 AM"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTicketInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
