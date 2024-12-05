import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String imageUrl;

  const HeaderImage({Key? key, required this.imageUrl}) : super(key: key);

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
      ],
    );
  }
}
