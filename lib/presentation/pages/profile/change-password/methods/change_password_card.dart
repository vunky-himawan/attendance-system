import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ChangePasswordCard extends StatelessWidget {
  const ChangePasswordCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kata Sandi Lama
        const Text(
          'Kata Sandi Lama',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildPasswordField(hintText: 'Masukkan Kata Sandi Lama'),
        const SizedBox(height: 16),

        // Kata Sandi Baru
        const Text(
          'Kata Sandi Baru',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildPasswordField(hintText: 'Masukkan Kata Sandi Baru'),
        const SizedBox(height: 16),

        // Konfirmasi Kata Sandi Baru
        const Text(
          'Konfirmasi Kata Sandi Baru',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildPasswordField(hintText: 'Masukkan Konfirmasi Kata Sandi Baru'),
      ],
    );
  }

  // Fungsi untuk membuat TextField dengan parameter hintText
  Widget _buildPasswordField({required String hintText}) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
