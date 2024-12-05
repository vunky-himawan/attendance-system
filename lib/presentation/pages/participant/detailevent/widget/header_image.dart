import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://via.placeholder.com/500x300',
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}