import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

Widget card(BuildContext context, WidgetRef ref, int data, String title,
        dynamic icon) =>
    Container(
      height: 130,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon is HeroIcons
                  ? HeroIcon(icon,
                      style: HeroIconStyle.solid,
                      color: Theme.of(context).colorScheme.secondary)
                  : Icon(icon, color: Theme.of(context).colorScheme.secondary)
            ],
          ),
          Text(
            data.toString(),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
