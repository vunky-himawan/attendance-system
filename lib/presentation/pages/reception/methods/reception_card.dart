import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'addReception_card.dart'; // Import AddReception page

class ReceptionCardPage extends ConsumerStatefulWidget {
  const ReceptionCardPage({super.key});

  @override
  _ReceptionCardPageState createState() => _ReceptionCardPageState();
}

class _ReceptionCardPageState extends ConsumerState<ReceptionCardPage> {
  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> receptionists = [
    {'Number': 'Resepsionis 1', 'Name': 'Resepsionis Example'},
    {'Number': 'Resepsionis 2', 'Name': 'Another Resepsionis'},
    {'Number': 'Resepsionis 3', 'Name': 'Yayun'},
    {'Number': 'Resepsionis 4', 'Name': 'Eldina'},
    {'Number': 'Resepsionis 5', 'Name': 'Yohana'},
  ];

  List<Map<String, String>> filteredReceptionists = [];

  @override
  void initState() {
    super.initState();
    filteredReceptionists = List.from(receptionists);
  }

  void filterReceptionists(String query) {
    setState(() {
      filteredReceptionists = receptionists
          .where((receptionist) =>
              receptionist['Name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void deleteReceptionist(String number) {
    setState(() {
      receptionists.removeWhere((receptionist) => receptionist['Number'] == number);
      filterReceptionists(searchController.text); // Filter ulang daftar sesuai query saat ini
    });
  }

  @override
  Widget build(BuildContext context) {
    final spaceForTitle = verticalSpace(16.0);
    final spaceForCard = verticalSpace(50.0);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/example.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Admin,',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  'Admin',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                spaceForCard,
                Container(
                  height: 60.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Cari nama pengguna',
                            border: InputBorder.none,
                          ),
                          onChanged: (query) {
                            filterReceptionists(query);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                spaceForTitle,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${filteredReceptionists.length} Resepsionis',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 10),
                    ...filteredReceptionists.map((receptionist) {
                      return Column(
                        children: [
                          buildBox(
                            'assets/example.jpg',
                            Number: receptionist['Number']!,
                            Name: receptionist['Name']!,
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBox(String imagePath, {required String Number, required String Name}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 30,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Number,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  Name,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit_note, color: Colors.black),
            onPressed: () {
              // Navigasi ke halaman AddReception
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddReception(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              deleteReceptionist(Number);
            },
          ),
        ],
      ),
    );
  }
}
