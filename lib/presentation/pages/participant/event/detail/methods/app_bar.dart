import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

Widget detailEventAppBar(BuildContext context) {
  return Positioned(
    top: 0,
    left: 0,
    right: 0,
    child: Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () {},
              child: const HeroIcon(
                color: Colors.black,
                HeroIcons.arrowLeft,
                size: 30,
              ),
            ),
            const Text(
              'Detail Acara',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () {},
              child: const HeroIcon(HeroIcons.heart, size: 30),
            ),
          ],
        ),
      ),
    ),
  );
}
