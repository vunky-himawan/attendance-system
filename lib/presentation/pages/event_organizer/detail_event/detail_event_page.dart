import 'package:eventpass_app/presentation/pages/event_organizer/detail_event/widget/header_image.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/detail_event/widget/speaker_card.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/detail_event/widget/statistic_item.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/detail_event/widget/tab_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Riverpod provider for selected tab index
final selectedIndexProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Detail',
      home: DetailEventTabPage(),
    );
  }
}

class DetailEventTabPage extends ConsumerWidget {
  const DetailEventTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Image
              HeaderImage(
                imageUrl: 'https://via.placeholder.com/400x250',
                title: 'Detail Acara',
                onBackPress: () => Navigator.pop(context),
              ),

              // Tab Navigation
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TabNavigation(
                  selectedIndex: selectedIndex,
                  onTabSelected: (index) => ref.read(selectedIndexProvider.notifier).state = index,
                ),
              ),

              // Tab Content
              selectedIndex == 0 ? _buildDetailSection() : _buildStatistikSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Detail Section
  Widget _buildDetailSection() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Judul Judul Apa Gitu Nanti Aja',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star_border, color: Colors.orange),
              SizedBox(width: 8),
              Text('4/5 • (11,390)'),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Tentang',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Deskripsi apa saja lah nanti yakan'),

          SizedBox(height: 24),
          Text(
            'Pembicara',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SpeakerCard(
                name: 'Ina Kio',
                role: 'Copywriter',
                imageUrl: 'https://via.placeholder.com/100',
              ),
              SizedBox(width: 16),
              SpeakerCard(
                name: 'Shaji',
                role: 'Designer',
                imageUrl: 'https://via.placeholder.com/100',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Statistik Section
  Widget _buildStatistikSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatisticItem(title: 'Tiket Terjual', value: '400/400'),
          const StatisticItem(title: 'Pengunjung', value: '400'),
          const StatisticItem(title: 'Absensi Masuk', value: '400'),
          const StatisticItem(title: 'Absensi Keluar', value: '400'),
          const StatisticItem(title: 'Pendapatan', value: 'Rp. 30.000.000'),
          const SizedBox(height: 24),
          const Text(
            'Kehadiran',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 200,
            color: Colors.grey.shade300, // Placeholder for chart
            child: const Center(child: Text('Chart Placeholder')),
          ),
        ],
      ),
    );
  }
}
