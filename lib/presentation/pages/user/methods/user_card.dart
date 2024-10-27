import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserCardPage extends ConsumerStatefulWidget {
  const UserCardPage({super.key});

  @override
  _UserCardPageState createState() => _UserCardPageState();
}

class _UserCardPageState extends ConsumerState<UserCardPage> {
  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> eventOrganizers = [
    {'Number': 'Admin 1', 'Name': 'Yayun Eldina'},
    {'Number': 'Admin 2', 'Name': 'Admin Example'},
    {'Number': 'Admin 3', 'Name': 'Another Admin'},
  ];

  List<Map<String, String>> visitors = [
    {'Number': 'Pengunjung 1', 'Name': 'Yayun Eldina'},
    {'Number': 'Pengunjung 2', 'Name': 'Pengunjung Example'},
    {'Number': 'Pengunjung 3', 'Name': 'Another Visitor'},
  ];

  // Lists for filtered results
  List<Map<String, String>> filteredEventOrganizers = [];
  List<Map<String, String>> filteredVisitors = [];

  @override
  void initState() {
    super.initState();
    // Initialize with full lists on first build
    filteredEventOrganizers = List.from(eventOrganizers);
    filteredVisitors = List.from(visitors);
  }

  void filterUsers(String query) {
    setState(() {
      filteredEventOrganizers = eventOrganizers
          .where((user) =>
              user['Name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      filteredVisitors = visitors
          .where((user) =>
              user['Name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final spaceForTitle = verticalSpace(16.0);
    final spaceForCard = verticalSpace(50.0);

    return DefaultTabController(
      length: 2, // Jumlah tab: Penyelenggara Acara dan Pengunjung
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bagian User Info manual untuk Superadmin
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
                                    'Superadmin,',
                                    style: Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'Super Admin',
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

                  // Search bar di atas tab "Penyelenggara Acara" dan "Pengunjung"
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
                              filterUsers(query);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  spaceForTitle,

                  // TabBar untuk "Penyelenggara Acara" dan "Pengunjung"
                  TabBar(
                    labelColor: Theme.of(context).colorScheme.primary,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    tabs: const [
                      Tab(text: 'Penyelenggara Acara'),
                      Tab(text: 'Pengunjung'),
                    ],
                  ),

                  // TabBarView untuk konten "Penyelenggara Acara" dan "Pengunjung"
                  SizedBox(
                    height: 400, // Sesuaikan tinggi konten
                    child: TabBarView(
                      children: [
                        // Daftar Penyelenggara Acara
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${filteredEventOrganizers.length} Penyelenggara Acara',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 10),
                            ...filteredEventOrganizers.map((user) {
                              return Column(
                                children: [
                                  buildBox(
                                    'assets/example.jpg',
                                    Number: user['Number']!,
                                    Name: user['Name']!,
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            }).toList(),
                          ],
                        ),

                        // Daftar Pengunjung
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${filteredVisitors.length} Pengunjung',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 10),
                            ...filteredVisitors.map((user) {
                              return Column(
                                children: [
                                  buildBox(
                                    'assets/example.jpg',
                                    Number: user['Number']!,
                                    Name: user['Name']!,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBox(String imagePath, {required String Number, required String Name}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 50,
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
        ],
      ),
    );
  }
}
