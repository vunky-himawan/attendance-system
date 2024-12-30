import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/participant/checkout/methods/checkout_card.dart';
import 'package:eventpass_app/presentation/pages/profile/wallets/wallet_page.dart';
import 'package:eventpass_app/presentation/providers/auth/auth_provider_setup.dart';
import 'package:eventpass_app/presentation/providers/event_data/event_provider_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  final String eventId;

  const CheckoutPage({super.key, required this.eventId});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  @override
  void initState() {
    super.initState();

    // Load event data after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(eventProvider.notifier).getEvent(eventId: widget.eventId);
      ref.read(authProvider.notifier).getParticipantDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventState = ref.watch(eventProvider);
    final authState = ref.watch(authProvider);

    if (authState.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (authState.participant == null) {
      return const Center(
        child: Text('Data tidak valid: Pengguna tidak memiliki informasi'),
      );
    }

    final event = eventState.events
        ?.firstWhere((element) => element.eventId == widget.eventId);

    final participant = authState.participant!;

    final balance = participant.amount;

    final isBalanceSufficient = balance >= event!.ticketPrice;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
              title: event!.title,
              date: event.startDate.toString(),
              location: event.address,
              price: event.ticketPrice,
            ),
            verticalSpace(32),

            // Balance Section
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
                        // Navigate to wallet page to add funds
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WalletPage(),
                          ),
                        );
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
                    ),
                  ],
                ),
                Text(
                  'Rp. ${balance.toString()}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: ghost,
                  ),
                ),
              ],
            ),
            const Spacer(),

            // Insufficient Balance Message
            if (!isBalanceSufficient)
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
                onPressed: isBalanceSufficient
                    ? () {
                        ref.read(eventProvider.notifier).registrationEvent(
                            eventId: event.eventId, ref: ref);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isBalanceSufficient ? darkBlue : ghost.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Bayar Sekarang',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
