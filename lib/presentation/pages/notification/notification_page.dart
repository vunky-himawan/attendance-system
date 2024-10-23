import 'package:eventpass_app/presentation/pages/notification/methods/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Pemberitahuan',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: List.generate(
          20,
          (index) {
            return notificationCard(
                context, 'Title $index', 'Description $index', '12:00 PM');
          },
        ),
      ),
    );
  }
}
