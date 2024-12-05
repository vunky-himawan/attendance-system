import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String price;

  const Footer({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          price,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Placeholder logic
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Fitur belum tersedia')),
            );
          },
          child: const Text("Beli Sekarang"),
        ),
      ],
    );
  }
}
