import 'package:eventpass_app/domain/entities/transaction/transaction.dart';
import 'package:eventpass_app/presentation/pages/profile/wallets/methods/wallet_card.dart';
import 'package:eventpass_app/presentation/providers/auth/auth_provider_setup.dart';
import 'package:eventpass_app/presentation/providers/transaction/transaction_provider_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletPage extends ConsumerStatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends ConsumerState<WalletPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(transactionProvider.notifier).getTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionState = ref.watch(transactionProvider);
    final userState = ref.watch(authProvider);

    if (transactionState.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final List<Transaction> transactions = transactionState.transactions ?? [];

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
                  Text(
                    '${userState.user!.role == "PARTICIPANT" ? userState.participant!.amount : userState.eventOrganizer!.amount}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userState.user!.userId.substring(0, 8),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        userState.user!.role == 'PARTICIPANT'
                            ? userState.user!.userId.substring(0, 4)
                            : userState.user!.userId.substring(0, 4),
                        style: const TextStyle(
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
                ref.read(transactionProvider.notifier).topUp(ref: ref);
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
                  final transaction = transactions[index];
                  return DigitalTicketsCard(
                    title: transaction.title,
                    date: transaction.createdAt.toString(),
                    price: transaction.amount,
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
