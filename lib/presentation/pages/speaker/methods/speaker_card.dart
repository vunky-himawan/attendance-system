import 'package:flutter/material.dart';

Widget speakerCard({
  required String fullNameHint,
  required String positionHint,
  required String companyHint,
  required String socialMediaHint,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Nama Lengkap',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextField(
        decoration: InputDecoration(
          hintText: fullNameHint,
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 16),
      
      const Text(
        'Gelar atau Jabatan',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextField(
        decoration: InputDecoration(
          hintText: positionHint,
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 16),
      
      const Text(
        'Perusahaan',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextField(
        decoration: InputDecoration(
          hintText: companyHint,
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 16),
      
      const Text(
        'LinkedIn/Instagram/Twitter',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextField(
        decoration: InputDecoration(
          hintText: socialMediaHint,
          border: OutlineInputBorder(),
        ),
      ),
    ],
  );
}
