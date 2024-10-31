import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

Widget recommendationEventCard(
    {required String imagePath,
    required String title,
    required String location,
    required String date}) {
  return Container(
    height: 150,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
    ),
    clipBehavior: Clip.antiAlias,
    child: Row(
      children: [
        Image.asset(
          imagePath,
          width: 120, // Atur lebar gambar sesuai kebutuhan
          height: double.infinity, // Atur tinggi gambar sesuai kebutuhan
          fit: BoxFit.cover,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.length > 40
                          ? '${title.substring(0, 40)}...'
                          : title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const HeroIcon(
                          HeroIcons.mapPin,
                          color: ghost,
                          size: 18,
                        ),
                        horizontalSpace(5),
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 14,
                            color: ghost,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const HeroIcon(
                      HeroIcons.calendar,
                      color: ghost,
                      size: 18,
                    ),
                    horizontalSpace(5),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 14, color: ghost),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
