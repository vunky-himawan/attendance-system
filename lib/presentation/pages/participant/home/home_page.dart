import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/participant/home/methods/search_result.dart';
import 'package:eventpass_app/presentation/pages/participant/home/methods/your_event_card.dart';
import 'package:eventpass_app/presentation/pages/participant/home/methods/recommendation_card.dart';
import 'package:eventpass_app/presentation/widgets/custom_search_bar.dart';
import 'package:eventpass_app/presentation/widgets/text/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;
  List<Map<String, String>> searchResults = [];

  // Data acara simulasi
  final List<Map<String, String>> events = [
    {
      "title": "Startup Conference 2023",
      "location": "Malang",
      "imagePath":
          "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "title": "Future of Tech Innovations",
      "location": "Jakarta",
      "imagePath":
          "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "title": "Networking Night for Startups",
      "location": "Solo",
      "imagePath":
          "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "title": "AI in Everyday Life",
      "location": "Jakarta",
      "imagePath":
          "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "title": "Party for Big Startups Congratulations",
      "location": "Jakarta",
      "imagePath":
          "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "title": "Party for Big Startups Congratulations",
      "location": "Jakarta",
      "imagePath":
          "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "title": "Party for Big Startups Congratulations",
      "location": "Jakarta",
      "imagePath":
          "https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
  ];

  // Fungsi pencarian
  void _onSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        isSearching = false;
        searchResults.clear();
      } else {
        isSearching = true;
        searchResults = events
            .where((event) =>
                event['title']!.toLowerCase().contains(query.toLowerCase()))
            .toList()
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(80),

                // Search Bar
                CustomSearchBar(
                  onSearch: _onSearch,
                  searchController: _searchController,
                ),
                verticalSpace(8),

                // Search Results
                if (isSearching)
                  SearchResultsWidget(searchResults: searchResults)
                else ...[
                  // Kode berikut TIDAK DIUBAH sesuai permintaan
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
