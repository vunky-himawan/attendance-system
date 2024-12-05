import 'package:flutter/material.dart';

class OrganizerRow extends StatelessWidget {
  const OrganizerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/50'),
        ),
        SizedBox(width: 8),
        Text("Ina Kio"),
      ],
    );
  }
}
