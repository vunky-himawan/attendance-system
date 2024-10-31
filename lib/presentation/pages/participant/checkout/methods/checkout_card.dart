import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

Widget checkoutCard({
  required String title,
  required String date,
  required String location,
  required int price,
}) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    height: 200,
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
        verticalSpace(8),
        Row(
          children: [
            const HeroIcon(
              HeroIcons.calendar,
              color: ghostBlack,
            ),
            horizontalSpace(8),
            Text(date),
          ],
        ),
        verticalSpace(4),
        Row(
          children: [
            const HeroIcon(
              HeroIcons.mapPin,
              color: ghostBlack,
            ),
            horizontalSpace(8),
            Text(location),
          ],
        ),
        const Spacer(),
        Text(
          'Rp. $price',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
