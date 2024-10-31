import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/add_event/methods/receptionist_card.dart';
import 'package:eventpass_app/presentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final receptionistListProvider = Provider<List<Map<String, String>>>((ref) {
  return [
    {
      'username': 'johndoe',
      'nama': 'John Doe',
      'image':
          'https://images.pexels.com/photos/28271498/pexels-photo-28271498/free-photo-of-a-plant-in-front-of-a-white-wall.jpeg',
    },
    {
      'username': 'johndoe',
      'nama': 'John Doe',
      'image':
          'https://images.pexels.com/photos/28271498/pexels-photo-28271498/free-photo-of-a-plant-in-front-of-a-white-wall.jpeg',
    },
  ];
});

// Provider untuk menyimpan daftar indeks receptionist yang dipilih
final selectedReceptionistProvider = StateProvider<List<int>>((ref) => []);

class AddReceptionistEventPage extends ConsumerWidget {
  const AddReceptionistEventPage({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final receptionistList = ref.watch(receptionistListProvider);
    final selectedreceptionist = ref.watch(selectedReceptionistProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Resepsionis',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
                    'Resepsionis',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Tambah Resepsionis',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF0300A2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomSearchBar(
                onSearch: (String query) {},
                searchController: TextEditingController(),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: receptionistList.length,
                  itemBuilder: (context, index) {
                    final receptionist = receptionistList[index];
                    final isSelected = selectedreceptionist.contains(index);
                    return ReceptionistCard(
                      name: receptionist['nama']!,
                      username: receptionist['username']!,
                      imageUrl: receptionist['image']!,
                      isSelected: isSelected,
                      onSelect: () {
                        ref
                            .read(selectedReceptionistProvider.notifier)
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
                    // Aksi saat tombol "Selanjutnya" ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Simpan',
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
