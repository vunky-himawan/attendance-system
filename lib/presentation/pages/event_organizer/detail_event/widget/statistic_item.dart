import 'package:flutter/material.dart';

class StatisticItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;

  const StatisticItem({
    required this.title,
    required this.subtitle,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
