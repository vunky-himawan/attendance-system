import 'package:eventpass_app/presentation/pages/participant/detailevent/widget/footer.dart';
import 'package:eventpass_app/presentation/pages/participant/detailevent/widget/header_image.dart';
import 'package:eventpass_app/presentation/pages/participant/detailevent/widget/info_row.dart';
import 'package:eventpass_app/presentation/pages/participant/detailevent/widget/organizer_row.dart';
import 'package:eventpass_app/presentation/pages/participant/detailevent/widget/rating_row.dart';
import 'package:eventpass_app/presentation/pages/participant/detailevent/widget/section_title.dart';
import 'package:eventpass_app/presentation/pages/participant/detailevent/widget/speaker_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider untuk status favorit
final favoriteProvider = StateNotifierProvider<FavoriteNotifier, bool>(
  (ref) => FavoriteNotifier(),
);

// Provider untuk mengelola pembelian tiket
final ticketPurchaseProvider = StateNotifierProvider<TicketPurchaseNotifier, bool>(
  (ref) => TicketPurchaseNotifier(),
);

class FavoriteNotifier extends StateNotifier<bool> {
  FavoriteNotifier() : super(false);

  void toggleFavorite() {
    state = !state;
  }
}

class TicketPurchaseNotifier extends StateNotifier<bool> {
  TicketPurchaseNotifier() : super(false);

  void purchaseTicket() {
    state = true; // Simulasikan pembelian tiket
  }
}

class EventDetailPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteProvider);
    final hasPurchasedTicket = ref.watch(ticketPurchaseProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Detail Acara",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.black,
            ),
            onPressed: () {
              ref.read(favoriteProvider.notifier).toggleFavorite();
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderImage (),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EventInformation(),
                  const SizedBox(height: 8),
                  const RatingRow(),
                  const SizedBox(height: 16),
                  const SectionTitle(title: "Tentang"),
                  const SizedBox(height: 8),
                  const Text(
                    "Pesta ini akan menjadi niat baik kami untuk menghubungkan para pendiri startup lainnya...",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const SectionTitle(title: "Pembicara"),
                  const SizedBox(height: 8),
                  const SpeakerRow(),
                  const SizedBox(height: 16),
                  const SectionTitle(title: "Diselenggarakan oleh"),
                  const SizedBox(height: 8),
                  const OrganizerRow(),
                  const SizedBox(height: 16),
                  Footer(
                    hasPurchasedTicket: hasPurchasedTicket,
                    onPurchase: () {
                      ref.read(ticketPurchaseProvider.notifier).purchaseTicket();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}