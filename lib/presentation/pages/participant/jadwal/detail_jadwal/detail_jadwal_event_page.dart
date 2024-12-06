import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/providers/detail_jadwal_provider.dart';
import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/widget/detail_tab.dart';
import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/widget/tab_button.dart';
import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/widget/ticket_tab.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JadwalDetailPage extends ConsumerWidget {
  const JadwalDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(eventDetailProvider);
    final selectedIndex = ref.watch(selectedTabProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Tinggi AppBar
        child: Stack(
          children: [
            // Background Transparan
            Container(
              color: Colors.transparent,
            ),

            // Tombol dan Title
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol Back
                  GestureDetector(
                    onTap: ref.watch(routerProvider).pop,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Lingkaran putih
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),

                  // Title
                  const Text(
                    "Detail Acara",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Tombol Favorite
                  GestureDetector(
                    onTap: () {
                      // Handle favorite action
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Lingkaran putih
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.favorite_border,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // Header Image
          Stack(
            children: [
              Image.network(
                event.imageUrl,
                width: double.infinity,
                height: 365,
                fit: BoxFit.cover,
              ),
            ],
          ),

          // Tab Navigation
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TabButton(
                    title: "Detail",
                    isSelected: selectedIndex == 0,
                    onTap: () =>
                        ref.read(selectedTabProvider.notifier).state = 0,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TabButton(
                    title: "Tiket",
                    isSelected: selectedIndex == 1,
                    onTap: () =>
                        ref.read(selectedTabProvider.notifier).state = 1,
                  ),
                ),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: selectedIndex == 0
                ? DetailTab(event: event)
                : TicketTab(event: event),
          ),
        ],
      ),
    );
  }
}
