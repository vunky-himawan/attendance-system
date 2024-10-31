import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const CustomSearchBar({
    super.key,
    required this.onSearch,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: searchController,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: ghostBlack,
              ),
              decoration: const InputDecoration(
                hintText: 'Cari nama pengguna',
                border: InputBorder.none,
              ),
              onChanged: onSearch,
            ),
          ),
        ],
      ),
    );
  }
}
