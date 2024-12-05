import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final bool hasPurchasedTicket;
  final VoidCallback onPurchase;

  const Footer({
    super.key,
    required this.hasPurchasedTicket,
    required this.onPurchase,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "\$69,000",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        ElevatedButton(
          onPressed: hasPurchasedTicket ? null : onPurchase,
          child: Text(hasPurchasedTicket ? "Dibeli" : "Beli Sekarang"),
        ),
      ],
    );
  }
}