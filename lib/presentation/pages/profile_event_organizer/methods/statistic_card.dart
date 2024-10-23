import 'package:flutter/material.dart';

Widget statisticCard(BuildContext context, String title, dynamic value) {
  return Expanded(
    child: Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text(title),
      ],
    ),
  );
}
