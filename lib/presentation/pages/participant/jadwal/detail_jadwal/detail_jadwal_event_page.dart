import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/providers/detail_jadwal_provider.dart';
import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/widget/detail_tab.dart';
import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/widget/tab_button.dart';
import 'package:eventpass_app/presentation/pages/participant/jadwal/detail_jadwal/widget/ticket_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JadwalDetailPage extends ConsumerWidget {
  const JadwalDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(eventDetailProvider);
    final selectedIndex = ref.watch(selectedTabProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Detail Acara",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Handle favorite action
            },
          ),
        ],
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
                    onTap: () => ref.read(selectedTabProvider.notifier).state = 0,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TabButton(
                    title: "Tiket",
                    isSelected: selectedIndex == 1,
                    onTap: () => ref.read(selectedTabProvider.notifier).state = 1,
                  ),
                ),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: selectedIndex == 0 ? DetailTab(event: event) : TicketTab(event: event),
          ),
        ],
      ),
    );
  }
}
