import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/superadmin/list_of_user/methods/user_card.dart';
import 'package:eventpass_app/presentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListOfUserPage extends ConsumerStatefulWidget {
  const ListOfUserPage({super.key});

  @override
  ConsumerState<ListOfUserPage> createState() => _ListOfUserPageState();
}

class _ListOfUserPageState extends ConsumerState<ListOfUserPage> {
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
                  verticalSpace(90),
                  CustomSearchBar(
                    onSearch: (String query) {},
                    searchController: searchController,
                  ),
                  spaceForTitle,

                  TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: darkBlue,
                    labelColor: darkBlue,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.grey,
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    tabs: const [
                      Tab(text: 'Penyelenggara Acara'),
                      Tab(text: 'Pengunjung'),
                    ],
                  ),

                  verticalSpace(8),
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
                              style: const TextStyle(
                                fontSize: 13,
                                color: ghost,
                              ),
                            ),
                            verticalSpace(10),
                            ...filteredEventOrganizers.map(
                              (user) {
                                return Column(
                                  children: [
                                    userCard(
                                      ref: ref,
                                      imagePath: 'assets/example.jpg',
                                      username: user['Number']!,
                                      name: user['Name']!,
                                      deleteUser: () {},
                                    ),
                                    verticalSpace(10),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),

                        // Daftar Pengunjung
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${filteredVisitors.length} Pengunjung',
                              style: const TextStyle(
                                fontSize: 13,
                                color: ghost,
                              ),
                            ),
                            verticalSpace(10),
                            ...filteredVisitors.map((user) {
                              return Column(
                                children: [
                                  userCard(
                                    ref: ref,
                                    imagePath: 'assets/example.jpg',
                                    username: user['Number']!,
                                    name: user['Name']!,
                                    deleteUser: () {},
                                  ),
                                  verticalSpace(10),
                                ],
                              );
                            }),
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
}
