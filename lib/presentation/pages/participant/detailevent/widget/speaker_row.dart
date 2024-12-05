import 'package:flutter/material.dart';

class SpeakerRow extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;

  const SpeakerRow({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name),
            Text(role, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
