import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/list_of_event/methods/event_card.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:eventpass_app/presentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

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

class ListOfEventPage extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController();
  final bool isAdmin;
  ListOfEventPage({super.key, this.isAdmin = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final acaraList = ref.watch(acaraListProvider);

    return Scaffold(
      floatingActionButton: isAdmin
          ? Stack(
              children: [
                Positioned(
                  bottom: 100, // Atur nilai ini untuk mengubah posisi vertikal
                  right: 16, // Atur posisi horizontal
                  child: Container(
                    width: 70,
                    height: 70,
                    child: FloatingActionButton(
                      onPressed: () {
                        ref
                            .watch(routerProvider)
                            .push('/event-organizer/events/add-event');
                      },
                      shape: CircleBorder(
                        side: BorderSide(
                          color: ghost.withOpacity(0.2),
                        ),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: const HeroIcon(
                        HeroIcons.plus,
                        color: Color(0xFF0300A2),
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SafeArea(
          child: Column(
            children: [
              verticalSpace(90),
              CustomSearchBar(
                onSearch: (String query) {},
                searchController: searchController,
              ),
              verticalSpace(15),
              Expanded(
                child: ListView.builder(
                  itemCount: acaraList.length,
                  itemBuilder: (context, index) {
                    final acara = acaraList[index];
                    return eventCard(
                      title: acara['judul']!,
                      date: acara['tanggal']!,
                      imageUrl: acara['image']!,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
