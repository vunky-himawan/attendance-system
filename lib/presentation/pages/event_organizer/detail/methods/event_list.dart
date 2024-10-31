import 'package:eventpass_app/presentation/pages/event_organizer/detail/methods/event_card.dart';
import 'package:flutter/material.dart';

Widget eventList(BuildContext context) {
  return ListView.separated(
    padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
    itemCount: 10,
    itemBuilder: (context, index) {
      return eventCard(
        context,
        'Title $index',
        'Location $index',
        '28 Oktober 202$index',
      );
    },
    separatorBuilder: (context, index) => const SizedBox(height: 16.0),
  );
}
