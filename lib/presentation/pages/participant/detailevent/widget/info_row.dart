import 'package:flutter/material.dart';

class EventInformation extends StatelessWidget {
  const EventInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.calendar_today, color: Colors.grey),
            SizedBox(width: 8),
            Text("19 Sabtu, 06:00 PM - 12:00 AM"),
          ],
        ),
        SizedBox(height: 16),
        Text(
          "Party for Big Startups Congratulations",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.grey),
            SizedBox(width: 8),
            Text("Auditorium Lantai 8 Gedung Sipil"),
          ],
        ),
      ],
    );
  }
}