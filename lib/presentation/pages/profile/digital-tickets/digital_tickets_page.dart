import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/profile/digital-tickets/methods/digital_tickets_card.dart'; 
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class DigitalTicketsPage extends StatelessWidget {
  const DigitalTicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List transaksi dengan tipe data yang eksplisit
    final List<Map<String, dynamic>> transactions = [
      {
        'title': 'Top Up',
        'date': 'Today, 10.00 PM',
        'price': 10000,
      },
      {
        'title': 'Top Up',
        'date': 'Today, 10.00 PM',
        'price': 10000,
      },
      {
        'title': 'Top Up',
        'date': 'Today, 10.00 PM',
        'price': 10000,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Dompet Digital',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Saldo Kartu
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Saldo Anda',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Rp. 100.000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '5282 3456 7890 1289',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '09/25',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Tombol Top Up
            ElevatedButton.icon(
              onPressed: () {
                // Navigasi ke halaman top-up
              },
              icon: const Icon(Icons.add),
              label: const Text('Top Up'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Riwayat Transaksi
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
               'Riwayat Transaksi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
           ),
           const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  // Mengakses elemen dalam transaksi
                  final transaction = transactions[index];
                  return DigitalTicketsCard(
                    title: transaction['title'] ?? 'Unknown Title',
                    date: transaction['date'] ?? 'Unknown Date',
                    price: transaction['price'] ?? 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
