
import 'dart:io';
import 'package:eventpass_app/presentation/pages/event/event_add_pembicara_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddDetailEventPage extends ConsumerStatefulWidget {
  const AddDetailEventPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddDetailEventPage> createState() => _AddDetailEventPageState();
}

class _AddDetailEventPageState extends ConsumerState<AddDetailEventPage> {
  File? _pickedImage;
  String? _selectedCategory; // State untuk kategori yang dipilih

  // Daftar kategori acara
  final List<String> _categories = [
    'Teknologi',
    'Olahraga',
    'Musik',
    'Pendidikan',
  ];

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Acara',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Membuat teks tebal
            fontSize: 20, // Menyesuaikan ukuran teks
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Widget Upload Gambar
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _pickedImage != null
                          ? Image.file(
                              _pickedImage!,
                              fit: BoxFit.cover,
                            )
                          : const Center(
                              child: Icon(Icons.upload, size: 50),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Nama Acara',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Harga Tiket',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Jumlah Tiket',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Tanggal',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Dropdown untuk Kategori Acara
                  DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    items: _categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Kategori',
                    ),
                    dropdownColor: Colors.white, // Warna dropdown saat dibuka
                    style: const TextStyle(
                      color: Colors
                          .black, // Warna teks dropdown dan item saat ditutup
                      fontSize: 16,
                    ),
                    icon: const Icon(Icons.arrow_drop_down,
                        color: Colors.black), // Warna icon dropdown
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Deskripsi',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddPembicaraEventPage(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF0300A2), // Warna latar tombol
                      foregroundColor: Colors.white, // Warna teks
                      minimumSize: const Size.fromHeight(50), // Tinggi tombol
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Sudut membulat
                      ),
                    ),
                    child: const Text(
                      'Selanjutnya',
                      style: TextStyle(
                        fontSize: 18, // Ukuran teks
                        fontWeight: FontWeight.bold, // Membuat teks tebal
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}