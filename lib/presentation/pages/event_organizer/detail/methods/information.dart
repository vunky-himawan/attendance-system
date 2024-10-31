import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

Widget information(
    BuildContext context, String address, String phone, String email) {
  return Container(
    child: Column(
      children: [
        verticalSpace(20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const HeroIcon(
                  HeroIcons.mapPin,
                  color: ghost,
                ),
                horizontalSpace(8),
                const Text(
                  'Alamat',
                  style: TextStyle(fontWeight: FontWeight.bold, color: ghost),
                )
              ],
            ),
            verticalSpace(8),
            Text(address)
          ],
        ),
        verticalSpace(20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const HeroIcon(
                  HeroIcons.phone,
                  color: ghost,
                ),
                horizontalSpace(8),
                const Text(
                  'Telepon',
                  style: TextStyle(fontWeight: FontWeight.bold, color: ghost),
                )
              ],
            ),
            verticalSpace(8),
            Text(phone),
          ],
        ),
        verticalSpace(20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const HeroIcon(
                  HeroIcons.envelope,
                  color: ghost,
                ),
                horizontalSpace(8),
                const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold, color: ghost),
                )
              ],
            ),
            verticalSpace(8),
            Text(email),
          ],
        )
      ],
    ),
  );
}
