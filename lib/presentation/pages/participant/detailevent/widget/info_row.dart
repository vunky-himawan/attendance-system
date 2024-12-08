import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class EventInformation extends StatelessWidget {
  const EventInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bagian informasi tanggal dan waktu dengan desain card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Row(
            children: [
              // Bagian tanggal
              Column(
                children: [
                  Text(
                    "19",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Sep",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              // Bagian hari dan waktu
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sabtu",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "06:00 PM - 12:00 AM",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Nama acara
        const Text(
          "Party for Big Startups Congratulations",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        // Lokasi acara
        const Row(
          children: [
            HeroIcon(HeroIcons.mapPin, color: Colors.black),
            SizedBox(width: 8),
            Text(
              "Auditorium Lantai 8 Gedung Sipil",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
