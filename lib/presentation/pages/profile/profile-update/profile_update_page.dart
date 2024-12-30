import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/profile/profile-update/methods/profile_update_card.dart'; 
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Perbarui Profil',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Foto Profil
                const Center(
                  child: ProfileUpdateCard(
                    name: "Shayna Ku",
                    username: "Howdy",
                    email: "howdycans68@gmail.com",
                  ),
                ),
                const SizedBox(height: 24),
                // Tombol Simpan
                ElevatedButton(
                  onPressed: () {
                    // Logika simpan data profil
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data profil berhasil disimpan!'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
