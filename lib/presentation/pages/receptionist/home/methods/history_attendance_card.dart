import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/receptionist/home/methods/label.dart';
import 'package:flutter/material.dart';

Widget historyAttendanceCard(BuildContext context, String title, String name,
    String status, String gender) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(
        color: ghost.withOpacity(0.2),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(gender == 'LAKI_LAKI'
                  ? "assets/male.png"
                  : "assets/female.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Absensi $title',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(name),
            ],
          ),
        ),
        label(context, status)
      ],
    ),
  );
}
