import 'package:flutter/material.dart';

class SpeakerRow extends StatelessWidget {
  const SpeakerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/50'),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ina Kio"),
            Text("Copywriter", style: TextStyle(color: Colors.grey)),
          ],
        ),
        SizedBox(width: 16),
        CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/50'),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shaji"),
            Text("Designer", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}