import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ReceptionistCard extends StatelessWidget {
  final String username;
  final String name;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onSelect;

  const ReceptionistCard({
    required this.username,
    required this.name,
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
              horizontalSpace(16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      name,
                      style: const TextStyle(color: ghost),
                    ),
                  ],
                ),
              ),
              // Tanda Centang untuk Pembicara yang Dipilih
              if (isSelected)
                const HeroIcon(
                  HeroIcons.check,
                  color: primaryGreen,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
