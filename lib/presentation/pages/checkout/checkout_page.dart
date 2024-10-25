import 'package:eventpass_app/presentation/pages/checkout/methods/checkout_card.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        // Add the default back button using leading
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back button functionality
          },
        ),
        title: const Text(
          'Pembayaran',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🎟️ Tiket',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            checkoutCard(
              title: 'Party for Big Startups Congratulations',
              date: 'Jumat, 20 Oktober 2024',
              location: 'Graha Politeknik Negeri Malang',
              price: 20000,
            ),
            const SizedBox(height: 32),
            const Text(
              'Saldo Saat Ini',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rp. 10000',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    // Aksi tambah saldo
                  },
                  child: const Text(
                    '+ Isi Saldo',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              'Saldo anda tidak cukup',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null, // Disabled button
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.grey.shade300, // Light gray background
                  disabledForegroundColor:
                      Colors.black.withOpacity(0.7), // Text color visibility
                ),
                child: const Text(
                  'Bayar Sekarang',
                  style: TextStyle(color: Colors.black), // Black text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
