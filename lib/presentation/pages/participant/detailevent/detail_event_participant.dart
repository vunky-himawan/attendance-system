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
            // Header Image
            Stack(
              children: [
                Image.network(
                  'https://via.placeholder.com/500x300',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.calendar_today, color: Colors.grey),
                      SizedBox(width: 8),
                      Text("19 Sabtu, 06:00 PM - 12:00 AM"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Party for Big Startups Congratulations",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.grey),
                      SizedBox(width: 8),
                      Text("Auditorium Lantai 8 Gedung Sipil"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star_border, color: Colors.orange),
                      SizedBox(width: 8),
                      Text("4/5 (11,300)"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Tentang",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Pesta ini akan menjadi niat baik kami untuk menghubungkan para pendiri startup lainnya dan mengembangkan bisnis bersama juga sehingga negara kita menjadi lebih baik di masa depan.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Pembicara",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/50'),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Ina Kio"),
                          Text("Copywriter", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(width: 16),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/50'),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Shaji"),
                          Text("Designer", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Diselenggarakan oleh",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/50'),
                      ),
                      SizedBox(width: 8),
                      Text("Ina Kio"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
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
                        onPressed: hasPurchasedTicket
                            ? null
                            : () {
                                ref.read(ticketPurchaseProvider.notifier).purchaseTicket();
                              },
                        child: Text(
                          hasPurchasedTicket ? "Dibeli" : "Beli Sekarang",
                        ),
                      ),
                    ],
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
