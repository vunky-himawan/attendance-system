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
final ticketPurchaseProvider =
    StateNotifierProvider<TicketPurchaseNotifier, bool>(
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
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteProvider);
    final hasPurchasedTicket = ref.watch(ticketPurchaseProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), // Tinggi total AppBar
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 16.0), // Tambahkan jarak dari atas dan kiri
            child: CircleAvatar(
              backgroundColor: Colors.white, // Lingkaran putih di kiri
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          title: Padding(
            padding:
                const EdgeInsets.only(top: 16.0), // Tambahkan jarak dari atas
            child: const Text(
              "Detail Acara",
              style: TextStyle(
                color: Colors.white, // Warna teks putih
                fontWeight: FontWeight.bold, // Teks bold
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0,
                  top: 16.0), // Tambahkan jarak dari atas dan kanan
              child: CircleAvatar(
                backgroundColor: Colors.white, // Lingkaran putih di kanan
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    ref.read(favoriteProvider.notifier).toggleFavorite();
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      extendBodyBehindAppBar: true,
      // floatingActionButton: Footer(
      //               hasPurchasedTicket: hasPurchasedTicket,
      //               onPurchase: () {
      //                 ref.read(ticketPurchaseProvider.notifier).purchaseTicket();
      //               },
      //             ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderImage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EventInformation(),
                  const SizedBox(height: 20),
                  const RatingRow(),
                  const SizedBox(height: 20),
                  const SectionTitle(title: "Tentang"),
                  const SizedBox(height: 8),
                  const Text(
                    "Pesta ini akan menjadi niat baik kami untuk menghubungkan para pendiri startup lainnya dan mengembangkan bisnis bersama juga sehingga negara kita menjadi lebih baik di masa depan.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  const SectionTitle(title: "Pembicara"),
                  const SizedBox(height: 8),
                  const SpeakerRow(),
                  const SizedBox(height: 20),
                  const SectionTitle(title: "Diselenggarakan oleh"),
                  const SizedBox(height: 8),
                  const OrganizerRow(),
                  const SizedBox(height: 20),
                  Footer(
                    hasPurchasedTicket: hasPurchasedTicket,
                    onPurchase: () {
                      ref
                          .read(ticketPurchaseProvider.notifier)
                          .purchaseTicket();
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
