import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class SpeakerCard extends StatelessWidget {
  final String name;
  final String job;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onSelect;

  const SpeakerCard({
    required this.name,
    required this.job,
    required this.imageUrl,
    this.isSelected = false,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect, // Memanggil callback saat card ditekan
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ghost.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Colors.transparent,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      job,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Tanda Centang untuk Pembicara yang Dipilih
              if (isSelected)
                const HeroIcon(
                  HeroIcons.check,
                  color: Colors.green,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
