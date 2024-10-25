import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/widgets/chart/bar_chart.dart';
import 'package:eventpass_app/presentation/widgets/chart/line_chart.dart';
import 'package:eventpass_app/presentation/widgets/chart/pie_chart.dart';
import 'package:eventpass_app/presentation/widgets/text/title.dart';
import 'package:eventpass_app/presentation/widgets/user_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaceForTitle = verticalSpace(16.0);
    final spaceForCard = verticalSpace(50.0);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bagian User Info
                userInfo(context, ref,
                    withNotification: true, withLogout: false),
                spaceForCard,

                // Search bar di atas judul "Acara Saya"
                Container(
                  height: 60.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        'Cari Acara',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                spaceForTitle,

                // Judul Dashboard
                title(context, ref, 'Acara Saya'),
                spaceForTitle,

                // Kotak-kotak acara di dalam Expanded
                SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildEventBox(
                          'Kotak 1',
                          'assets/example-event.jpg',
                          eventName: 'Party for Big Startups Congratulations',
                          eventDuration: 'dalam 2 hari',
                        ),
                        SizedBox(width: 10),
                        buildEventBox(
                          'Kotak 2',
                          'assets/example-event.jpg',
                          eventName: 'Startup Excellence Awards',
                          eventDuration: 'dalam 7 hari',
                        ),
                        SizedBox(width: 10),
                        buildEventBox(
                          'Kotak 3',
                          'assets/example-event.jpg',
                          eventName: 'Startup Leaders Recognition Night',
                          eventDuration: 'dalam 1 hari',
                        ),
                        SizedBox(width: 10),
                        buildEventBox(
                          'Kotak 4',
                          'assets/example-event.jpg',
                          eventName: 'Startup Milestone Celebration',
                          eventDuration: 'dalam 5 hari',
                        ),
                        SizedBox(width: 10),
                        buildEventBox(
                          'Kotak 5',
                          'assets/example-event.jpg',
                          eventName: 'Startup Pioneers Recognition Event',
                          eventDuration: 'dalam 10 hari',
                        ),
                      ],
                    ),
                  ),
                ),
                spaceForTitle,

                // Judul Dashboard untuk Rekomendasi Acara
                title(context, ref, 'Rekomendasi Acara'),
                spaceForTitle,

                // Kotak-kotak rekomendasi acara
                Column(
                  children: [
                    buildBox(
                      'assets/example-event.jpg',
                      eventName: 'Future of Tech Innovations',
                      eventDuration: 'dalam 3 hari',
                    ),
                    SizedBox(height: 10), // Spasi antara kotak
                    buildBox(
                      'assets/example-event.jpg',
                      eventName: 'Networking Night for Startups',
                      eventDuration: 'dalam 4 hari',
                    ),
                    SizedBox(height: 10), // Spasi antara kotak
                    buildBox(
                      'assets/example-event.jpg',
                      eventName: 'Networking Night for Startups',
                      eventDuration: 'dalam 4 hari',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun kotak acara
  Widget buildEventBox(String label, String imagePath,
      {required String eventName, required String eventDuration}) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar dengan sudut melengkung
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Deskripsi acara
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  eventDuration,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBox(String imagePath,
      {required String eventName, required String eventDuration}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Gambar di sebelah kiri
          Image.asset(
            imagePath,
            width: 100, // Atur lebar gambar sesuai kebutuhan
            height: 100, // Atur tinggi gambar sesuai kebutuhan
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10), // Spasi antara gambar dan teks
          // Deskripsi di sebelah kanan
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  eventDuration,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
