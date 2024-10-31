import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/widgets/input/custom_drop_down.dart';
import 'package:eventpass_app/presentation/widgets/input/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';

class AddEventPage extends ConsumerStatefulWidget {
  const AddEventPage({super.key});

  @override
  ConsumerState<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends ConsumerState<AddEventPage> {
  File? _pickedImage;
  String? _selectedCategory; // State untuk kategori yang dipilih
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDateController = TextEditingController();
  final TextEditingController eventLocationController = TextEditingController();
  final TextEditingController eventPriceController = TextEditingController();
  final TextEditingController eventCategoryController = TextEditingController();
  final TextEditingController eventDescriptionController =
      TextEditingController();
  final TextEditingController eventTicketQuantityController =
      TextEditingController();

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Widget Upload Gambar
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gambar',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      verticalSpace(4),
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            height: 100,
                            width: 100,
                            child: _pickedImage != null
                                ? Image.file(
                                    _pickedImage!,
                                    fit: BoxFit.cover,
                                  )
                                : DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(12),
                                    dashPattern: const [5, 5],
                                    child: const Center(
                                      child: HeroIcon(
                                        HeroIcons.plus,
                                        color: ghostBlack,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  CustomTextField(
                      labelText: 'Nama Acara',
                      controller: eventNameController,
                      hintText: 'Nama Acara'),
                  verticalSpace(16),
                  CustomTextField(
                      labelText: 'Harga Tiket',
                      controller: eventPriceController,
                      hintText: 'Harga Tiket'),
                  verticalSpace(16),
                  CustomTextField(
                      labelText: 'Jumlah Tiket',
                      controller: eventTicketQuantityController,
                      hintText: 'Jumlah Tiket'),
                  verticalSpace(16),
                  CustomTextField(
                      labelText: 'Tanggal',
                      controller: eventDateController,
                      hintText: 'Tanggal'),
                  verticalSpace(16),
                  CustomTextField(
                      labelText: 'Lokasi',
                      controller: eventLocationController,
                      hintText: 'Lokasi'),
                  verticalSpace(16),
                  // Dropdown untuk Kategori Acara
                  CustomDropDown(
                    categories: _categories,
                    labelText: 'Kategori',
                    hintText: 'Kategori',
                  ),
                  verticalSpace(16),
                  CustomTextField(
                      labelText: 'Deskripsi',
                      maxLines: 5,
                      controller: eventDescriptionController,
                      hintText: 'Deskripsi'),
                  verticalSpace(16),
                  ElevatedButton(
                    onPressed: () {},
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
