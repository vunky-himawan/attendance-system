import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

Widget receptionistCard(WidgetRef ref, String imagePath, String number,
    String name, void Function() deleteReceptionist) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.withOpacity(0.3)),
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 25,
        ),
        horizontalSpace(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const HeroIcon(
            HeroIcons.pencilSquare,
            color: ghostBlack,
          ),
          onPressed: () {
            ref.watch(routerProvider).pushNamed('add-receptionist');
          },
        ),
        IconButton(
          icon: const HeroIcon(
            HeroIcons.trash,
            color: primaryRed,
          ),
          onPressed: deleteReceptionist,
        ),
      ],
    ),
  );
}
