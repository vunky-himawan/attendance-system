import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/widgets/input/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddSpeakerPage extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _socialMediaController = TextEditingController();

  AddSpeakerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Tambah Pembicara',
          style: TextStyle(
            color: ghostBlack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              labelText: 'Nama Lengkap',
              controller: _fullNameController,
              hintText: 'Nama Lengkap',
            ),
            verticalSpace(16),
            CustomTextField(
              labelText: 'Gelar atau Jabatan',
              controller: _titleController,
              hintText: 'Gelar atau Jabatan',
            ),
            verticalSpace(16),
            CustomTextField(
              labelText: 'Perusahaan',
              controller: _companyController,
              hintText: 'Perusahaan',
            ),
            verticalSpace(16),
            CustomTextField(
              labelText: 'LinkedIn/Instagram/Twitter',
              controller: _socialMediaController,
              hintText: 'LinkedIn/Instagram/Twitter',
            ),
            verticalSpace(16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add save functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Set corner radius
                  ),
                ),
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
