import 'package:eventpass_app/presentation/pages/event_organizer/detail_event/widget/header_image.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/detail_event/widget/speaker_card.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/detail_event/widget/statistic_item.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/detail_event/widget/tab_navigation.dart';
import 'package:eventpass_app/presentation/providers/admin/chart_data/chart_data_provider.dart';
import 'package:eventpass_app/presentation/widgets/chart/bar_chart.dart';
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
                imageUrl: 'https://images.pexels.com/photos/321552/pexels-photo-321552.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1/400x250',
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
              selectedIndex == 0 ? _buildDetailSection() : _buildStatistikSection(context, ref),
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
  Widget _buildStatistikSection(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatisticItem(title: 'Tiket Terjual', subtitle: 'Total tiket yang terjual', value: '400/400'),
          const StatisticItem(title: 'Pengunjung', subtitle: 'Pengunjung yang terdaftar',value: '400'),
          const StatisticItem(title: 'Absensi Masuk', subtitle: 'Pengunjung yang melakukan absensi masuk',value: '400'),
          const StatisticItem(title: 'Absensi Keluar', subtitle: 'Pengunjung yang melakukan absensi keluar',value: '400'),
          const StatisticItem(title: 'Pendapatan', subtitle: 'Total pemasukan dari penjualan tiket',value: 'Rp. 30.000.000'),
          const SizedBox(height: 24),
          Container(
            height: 350,
            color: Colors.white, // Placeholder for chart
            child: barChart(context, ref, 'Kehadiran', ref.watch(ageGroupData))
          ),
        ],
      ),
    );
  }
}
