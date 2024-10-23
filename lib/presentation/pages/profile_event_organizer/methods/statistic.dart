import 'package:eventpass_app/presentation/pages/profile_event_organizer/methods/statistic_card.dart';
import 'package:flutter/material.dart';

Widget statistic(BuildContext context, List<Map<String, dynamic>> data) {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
    width: double.infinity,
    height: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: data
          .map((e) => statisticCard(context, e['title'], e['value']))
          .toList(),
    ),
  );
}
