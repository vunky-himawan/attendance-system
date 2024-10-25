import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';

Widget userInfo(
    BuildContext context, String name, String city, String joined_at) {
  return Row(
    children: [
      Container(
        width: 90,
        height: 90,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/example.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      horizontalSpace(16.0),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: city,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                      fontSize: 14,
                    ),
                  ),
                  const TextSpan(
                    text: ' | Joined at ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: ghost,
                      fontSize: 14,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Text(
                      joined_at,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ghost,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ],
  );
}
