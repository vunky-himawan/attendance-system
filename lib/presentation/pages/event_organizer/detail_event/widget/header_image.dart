import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onBackPress;

  const HeaderImage({
    required this.imageUrl,
    required this.title,
    required this.onBackPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            onPressed: onBackPress,
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}