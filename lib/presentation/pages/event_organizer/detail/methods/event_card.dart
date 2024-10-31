import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

Widget eventCard(
    BuildContext context, String title, String location, String date) {
  return Container(
    width: double.infinity,
    height: 150,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    clipBehavior: Clip.antiAlias,
    child: Row(
      children: [
        Container(
          width: 110,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/example-event.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          const HeroIcon(
                            HeroIcons.mapPin,
                            color: ghost,
                          ),
                          horizontalSpace(8),
                          Text(
                            location,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    const HeroIcon(
                      HeroIcons.calendar,
                      color: ghost,
                    ),
                    horizontalSpace(8),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
