import 'package:flutter/material.dart';

class OrganizerRow extends StatelessWidget {
  const OrganizerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100], // Warna latar belakang kartu
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          // Gambar profil penyelenggara
          CircleAvatar(
            radius: 30, // Ukuran avatar
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(width: 12),
          // Nama penyelenggara
          Expanded(
            child: Text(
              "Ina Kio",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
