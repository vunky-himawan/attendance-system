import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String title;
  final dynamic icon;

  const BottomNavBarItem(
      {super.key,
      required this.index,
      required this.isSelected,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: icon is IconData
              ? Icon(
                  icon,
                  size: 30,
                  color: isSelected ? saffron : softGray,
                )
              : HeroIcon(
                  icon,
                  size: 30,
                  color: isSelected ? saffron : softGray,
                ),
        ),
        Text(
          title,
          style: TextStyle(
            color: isSelected ? saffron : softGray,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
