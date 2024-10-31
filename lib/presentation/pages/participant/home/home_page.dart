import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/participant/home/methods/your_event_card.dart';
import 'package:eventpass_app/presentation/pages/participant/home/methods/recommendation_card.dart';
import 'package:eventpass_app/presentation/widgets/custom_search_bar.dart';
import 'package:eventpass_app/presentation/widgets/text/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  final TextEditingController _searchController = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(80),
                CustomSearchBar(
                  onSearch: (String query) {},
                  searchController: _searchController,
                ),
                verticalSpace(8),

                // Judul Dashboard
                title(context, ref, 'Acara Saya'),
                verticalSpace(8),

                // Kotak-kotak acara di dalam Expanded
                SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        youtEventCard(
                          title: 'Party for Big Startups Congratulations',
                          eventCountdown: 'dalam 3 hari',
                          imagePath: 'assets/example-event.jpg',
                        ),
                        horizontalSpace(10),
                        youtEventCard(
                          title: 'Party for Big Startups Congratulations',
                          eventCountdown: 'dalam 3 hari',
                          imagePath: 'assets/example-event.jpg',
                        ),
                        horizontalSpace(10),
                        youtEventCard(
                          title: 'Party for Big Startups Congratulations',
                          eventCountdown: 'dalam 3 hari',
                          imagePath: 'assets/example-event.jpg',
                        ),
                        horizontalSpace(10),
                        youtEventCard(
                          title: 'Party for Big Startups Congratulations',
                          eventCountdown: 'dalam 3 hari',
                          imagePath: 'assets/example-event.jpg',
                        ),
                        horizontalSpace(10),
                        youtEventCard(
                          title: 'Party for Big Startups Congratulations',
                          eventCountdown: 'dalam 3 hari',
                          imagePath: 'assets/example-event.jpg',
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(30),

                // Judul Dashboard untuk Rekomendasi Acara
                title(context, ref, 'Rekomendasi Acara'),
                verticalSpace(8),

                // Kotak-kotak rekomendasi acara
                Column(
                  children: [
                    recommendationEventCard(
                      imagePath: 'assets/example-event.jpg',
                      title:
                          'Future of Tech Innovations Future of Tech Innovations',
                      date: 'Minggu, 21 Agustus 2022',
                      location: 'Jakarta',
                    ),
                    verticalSpace(10), // Spasi antara kotak
                    recommendationEventCard(
                      imagePath: 'assets/example-event.jpg',
                      title: 'Networking Night for Startups',
                      date: 'Minggu, 21 Agustus 2022',
                      location: 'Jakarta',
                    ),
                    verticalSpace(10), // Spasi antara kotak
                    recommendationEventCard(
                      imagePath: 'assets/example-event.jpg',
                      title: 'Networking Night for Startups',
                      date: 'Minggu, 21 Agustus 2022',
                      location: 'Jakarta',
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
}
