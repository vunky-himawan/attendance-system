import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TabNavigation({
    required this.selectedIndex,
    required this.onTabSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedIndex == 0 ? Colors.blue.shade900 : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade900),
              ),
              child: Text(
                'Details',
                style: TextStyle(
                  color: selectedIndex == 0 ? Colors.white : Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(1),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedIndex == 1 ? Colors.blue.shade900 : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade900),
              ),
              child: Text(
                'Statistika',
                style: TextStyle(
                  color: selectedIndex == 1 ? Colors.white : Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}