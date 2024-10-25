import 'package:flutter/material.dart';

Widget checkoutCard({
  required String title,
  required String date,
  required String location,
  required int price,
}) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.blue.shade100),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.calendar_today, size: 16),
            const SizedBox(width: 8),
            Text(date),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16),
            const SizedBox(width: 8),
            Text(location),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Rp. $price',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
