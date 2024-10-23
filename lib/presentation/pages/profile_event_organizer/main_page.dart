import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/pages/profile_event_organizer/methods/event_list.dart';
import 'package:eventpass_app/presentation/pages/profile_event_organizer/methods/information.dart';
import 'package:eventpass_app/presentation/pages/profile_event_organizer/methods/statistic.dart';
import 'package:eventpass_app/presentation/pages/profile_event_organizer/methods/user_info.dart';
import 'package:eventpass_app/presentation/widgets/divider.dart';
import 'package:eventpass_app/presentation/widgets/tabbar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verticalSpaceForWidget = verticalSpace(16.0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile Universal Studio',
          style: TextStyle(color: ghostBlack),
        ),
        iconTheme: const IconThemeData(
          color: ghostBlack,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            userInfo(context, "Universal Studio", 'Malang', 'October 2023'),
            verticalSpaceForWidget,
            divider(context),
            verticalSpaceForWidget,
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc odio sem,  laoreet eget nunc non, aliquam vulputate nulla. Quisque ut eleifend  lorem. Maecenas luctus velit nec magna ultrices elementum.',
            ),
            verticalSpaceForWidget,
            divider(context),
            statistic(
              context,
              [
                {'title': 'Acara', 'value': 200},
                {'title': 'Pengunjung', 'value': 200},
                {'title': 'Tiket', 'value': 200},
              ],
            ),
            divider(context),
            Expanded(
              child: Tabbar(
                tabs: const [
                  Tab(text: 'Statistik'),
                  Tab(text: 'Informasi'),
                ],
                tabController: _tabController,
                tabViews: [
                  eventList(context),
                  information(
                      context, 'Jalan 1', '08123456789', 'email@gmail.com'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
