import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavBarItem> items;
  final void Function(int index) onTap;
  final int selectedIndex;

  const BottomNavBar(
      {super.key,
      required this.items,
      required this.onTap,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(90, 158, 158, 158),
              blurRadius: 30,
              spreadRadius: 0,
              offset: Offset(0, 8),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items
              .map(
                (e) => GestureDetector(
                  onTap: () => onTap(e.index),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
