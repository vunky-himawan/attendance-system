import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/add_event/methods/speaker_card.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:eventpass_app/presentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pembicaraListProvider = Provider<List<Map<String, String>>>((ref) {
  return [
    {
      'nama': 'John Doe',
      'job': 'Copywriter',
      'image':
          'https://images.pexels.com/photos/28271498/pexels-photo-28271498/free-photo-of-a-plant-in-front-of-a-white-wall.jpeg',
    },
    {
      'nama': 'John Doe',
      'job': 'Copywriter',
      'image':
          'https://images.pexels.com/photos/28271498/pexels-photo-28271498/free-photo-of-a-plant-in-front-of-a-white-wall.jpeg',
    },
  ];
});

// Provider untuk menyimpan daftar indeks pembicara yang dipilih
final selectedPembicaraProvider = StateProvider<List<int>>((ref) => []);

class EventAddSpeakerPage extends ConsumerWidget {
  final TextEditingController _searchController = TextEditingController();
  EventAddSpeakerPage({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final pembicaraList = ref.watch(pembicaraListProvider);
    final selectedPembicara = ref.watch(selectedPembicaraProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Pembicara',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: ghostBlack,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pembicara',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Tambah Pembicara',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF0300A2),
                    ),
                  ),
                ],
              ),
              verticalSpace(16),
              CustomSearchBar(
                onSearch: (String query) {},
                searchController: _searchController,
              ),
              verticalSpace(16),
              Expanded(
                child: ListView.builder(
                  itemCount: pembicaraList.length,
                  itemBuilder: (context, index) {
                    final pembicara = pembicaraList[index];
                    final isSelected = selectedPembicara.contains(index);
                    return SpeakerCard(
                      name: pembicara['nama']!,
                      job: pembicara['job']!,
                      imageUrl: pembicara['image']!,
                      isSelected: isSelected,
                      onSelect: () {
                        ref
                            .read(selectedPembicaraProvider.notifier)
                            .update((selected) {
                          if (isSelected) {
                            return selected.where((i) => i != index).toList();
                          } else {
                            return [...selected, index];
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              // Next Button
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    ref.watch(routerProvider).push('/event-add-receptionist');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Selanjutnya',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
