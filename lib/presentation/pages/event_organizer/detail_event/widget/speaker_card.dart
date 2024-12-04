import 'package:flutter/material.dart';

class SpeakerCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const SpeakerCard({
    required this.name,
    required this.role,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 32,
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(role),
          ],
        ),
      ),
    );
  }
}