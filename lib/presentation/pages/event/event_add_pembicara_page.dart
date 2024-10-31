import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

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

class PembicaraCard extends StatelessWidget {
  final String name;
  final String job;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onSelect;

  const PembicaraCard({
    required this.name,
    required this.job,
    required this.imageUrl,
    this.isSelected = false,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect, // Memanggil callback saat card ditekan
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      job,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Tanda Centang untuk Pembicara yang Dipilih
              if (isSelected)
                HeroIcon(
                  HeroIcons.check,
                  color: Colors.green,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          hintText: 'Cari pembicara',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15), // Atur padding vertikal
        ),
      ),
    );
  }
}

class AddPembicaraEventPage extends ConsumerWidget {
  const AddPembicaraEventPage({Key? key}) : super(key: key);

  Widget build(BuildContext context, WidgetRef ref) {
    final pembicaraList = ref.watch(pembicaraListProvider);
    final selectedPembicara = ref.watch(selectedPembicaraProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Pembicara',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
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
              const SizedBox(height: 16),
              const SearchBar(),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: pembicaraList.length,
                  itemBuilder: (context, index) {
                    final pembicara = pembicaraList[index];
                    final isSelected = selectedPembicara.contains(index);
                    return PembicaraCard(
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
                  // Aksi saat tombol "Selanjutnya" ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddPembicaraEventPage(),
                    )
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0300A2),
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