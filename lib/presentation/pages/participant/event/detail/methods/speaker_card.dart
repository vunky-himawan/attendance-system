import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';

Widget speakerCard(BuildContext context, String name, String title) {
  return IntrinsicWidth(
    child: Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/male.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(title)
            ],
          )
        ],
      ),
    ),
  );
}
