import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.star, color: Colors.orange),
        Icon(Icons.star, color: Colors.orange),
        Icon(Icons.star, color: Colors.orange),
        Icon(Icons.star, color: Colors.orange),
        Icon(Icons.star_border, color: Colors.orange),
        SizedBox(width: 8),
        Text("4/5 (11,300)"),
      ],
    );
  }
}
