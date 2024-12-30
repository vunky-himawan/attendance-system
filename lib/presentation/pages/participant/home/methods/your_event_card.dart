import 'package:eventpass_app/infrastructure/config/app_config.dart';
import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';

Widget youtEventCard(
    {required String title,
    required String eventCountdown,
    required String imagePath}) {
  return Container(
    padding: const EdgeInsets.all(13),
    width: 310,
    decoration: BoxDecoration(
      border: Border.all(color: ghost.withOpacity(0.2)),
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gambar dengan sudut melengkung
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            '${AppConfig.assetBaseUrl}/$imagePath',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 125,
          ),
        ),
        verticalSpace(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                eventCountdown,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
