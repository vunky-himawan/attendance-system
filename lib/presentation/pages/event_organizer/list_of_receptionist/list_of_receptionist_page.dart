import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/list_of_receptionist/methods/receptionist_card.dart';
import 'package:eventpass_app/presentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListOfReceptionistPage extends ConsumerStatefulWidget {
  const ListOfReceptionistPage({super.key});

  @override
  ConsumerState<ListOfReceptionistPage> createState() =>
      _ListOfReceptionistPageState();
}

class _ListOfReceptionistPageState
    extends ConsumerState<ListOfReceptionistPage> {
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
      receptionists
          .removeWhere((receptionist) => receptionist['Number'] == number);
      filterReceptionists(
          searchController.text); // Filter ulang daftar sesuai query saat ini
    });
  }

  @override
  Widget build(BuildContext context) {
    final spaceForTitle = verticalSpace(16.0);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(90),
                CustomSearchBar(
                  onSearch: filterReceptionists,
                  searchController: searchController,
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
                    verticalSpace(10),
                    ...filteredReceptionists.map(
                      (receptionist) {
                        return Column(
                          children: [
                            receptionistCard(
                              ref,
                              'assets/example.jpg',
                              receptionist['Number']!,
                              receptionist['Name']!,
                              () => deleteReceptionist(receptionist['Number']!),
                            ),
                            verticalSpace(10),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
