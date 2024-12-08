import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://images.pexels.com/photos/2574643/pexels-photo-2574643.jpeg',
          width: double.infinity,
          height: 365,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}