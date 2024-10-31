import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/participant/checkout/methods/checkout_card.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        // Add the default back button using leading
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.watch(routerProvider).pop();
          },
        ),
        title: const Text(
          'Pembayaran',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const HeroIcon(
                  HeroIcons.ticket,
                  size: 24,
                  color: darkBlue,
                  style: HeroIconStyle.solid,
                ),
                horizontalSpace(8),
                const Text(
                  'Tiket',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            checkoutCard(
              title: 'Party for Big Startups Congratulations',
              date: 'Jumat, 20 Oktober 2024',
              location: 'Graha Politeknik Negeri Malang',
              price: 20000,
            ),
            verticalSpace(32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Saldo Saat Ini',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref.watch(routerProvider).push('/participant/top-up');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          const HeroIcon(
                            HeroIcons.plus,
                            size: 16,
                            color: darkBlue,
                          ),
                          horizontalSpace(8),
                          const Text(
                            'Isi Saldo',
                            style: TextStyle(
                              color: darkBlue,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Text(
                  'Rp. 10000',
                  style: TextStyle(
                    fontSize: 20,
                    color: ghost,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              'Saldo anda tidak cukup',
              style: TextStyle(
                color: primaryRed,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledBackgroundColor: ghost.withOpacity(0.2),
                ),
                child: const Text(
                  'Bayar Sekarang',
                  style: TextStyle(color: ghost), // Black text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
