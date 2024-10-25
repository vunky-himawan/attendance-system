import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

Widget notificationCard(
    BuildContext context, String title, String description, String time) {
  return Container(
    width: double.infinity,
    height: 100,
    padding: const EdgeInsets.all(16.0),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const HeroIcon(
          HeroIcons.inbox,
          color: darkBlue,
        ),
        horizontalSpace(16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title,
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text(time),
                      ],
                    ),
                  )
                ],
              ),
              Text(description),
            ],
          ),
        )
      ],
    ),
  );
}
