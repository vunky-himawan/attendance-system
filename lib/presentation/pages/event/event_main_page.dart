import 'package:eventpass_app/presentation/pages/event/event_add_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:eventpass_app/presentation/widgets/user_info/user_info.dart';

final acaraListProvider = Provider<List<Map<String, String>>>((ref) {
  return [
    {
      'judul': 'Seminar Teknologi 2024',
      'tanggal': 'Minggu, 20 Jan 2025',
      'image':
          'https://images.pexels.com/photos/28271498/pexels-photo-28271498/free-photo-of-a-plant-in-front-of-a-white-wall.jpeg',
    },
    {
      'judul': 'Seminar Teknologi 2024',
      'tanggal': 'Minggu, 20 Jan 2025',
      'image':
          'https://images.pexels.com/photos/28271498/pexels-photo-28271498/free-photo-of-a-plant-in-front-of-a-white-wall.jpeg',
    },
  ];
});

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Cari acara',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15), // Atur padding vertikal
        ),
      ),
    );
  }
}

class AcaraCard extends StatelessWidget {
  final String title;
  final String date;
  final String imageUrl;

  const AcaraCard({
    required this.title,
    required this.date,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  imageUrl,
                  width: 75,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            const Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeroIcon(HeroIcons.pencilSquare, color: Colors.black),
                    SizedBox(width: 4.0), // Jarak antara ikon dan teks
                    Text('Ubah', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(width: 20), // Jarak antar icon dan text
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeroIcon(HeroIcons.trash, color: Colors.red),
                    SizedBox(width: 4.0),
                    Text('Hapus',
                        style: TextStyle(fontSize: 12, color: Colors.red)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomFABLocation extends FloatingActionButtonLocation {
  final double x;
  final double y;

  CustomFABLocation({required this.x, required this.y});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = scaffoldGeometry.scaffoldSize.width * x;
    final double fabY = scaffoldGeometry.scaffoldSize.height * y;
    return Offset(fabX, fabY);
  }
}

class EventPage extends ConsumerWidget {
  const EventPage({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final acaraList = ref.watch(acaraListProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDetailEventPage(),
            )
          );
        },
        shape: CircleBorder(),
        backgroundColor: Colors.grey[100],
        child: const HeroIcon(
          HeroIcons.plus,
          color: Color(0xFF0300A2),
          size: 35,
        ),
      ),
      floatingActionButtonLocation: CustomFABLocation(x: 0.8, y: 0.75),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userInfo(context, ref,
                      withNotification: false, withLogout: false),
                  SizedBox(height: 15.0),
                  const SearchBar()
                ],
              ),
              SizedBox(height: 15.0),
              Expanded(
                child: ListView.builder(
                  itemCount: acaraList.length,
                  itemBuilder: (context, index) {
                    final acara = acaraList[index];
                    return AcaraCard(
                      title: acara['judul']!,
                      date: acara['tanggal']!,
                      imageUrl: acara['image']!,
                    );
                  },
                )
              )
            ],
          )
        ),
      )
    );
  }
}