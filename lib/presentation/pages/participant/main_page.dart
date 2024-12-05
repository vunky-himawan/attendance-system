import 'package:eventpass_app/presentation/pages/participant/home/home_page.dart';
import 'package:eventpass_app/presentation/pages/participant/jadwal/jadwal_home/jadwal_event_page.dart' as jadwal_event_page;
import 'package:eventpass_app/presentation/widgets/bottom_nav_bar.dart';
import 'package:eventpass_app/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:eventpass_app/presentation/widgets/user_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) => setState(
                () {
                  selectedPage = value;
                },
              ),
              children: [
                HomePage(),
                jadwal_event_page.JadwalPage(),
                const Center(child: Text("Bookmark Page")),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: userInfo(context, ref),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BottomNavBar(
                items: [
                  BottomNavBarItem(
                    index: 0,
                    isSelected: selectedPage == 0,
                    title: 'Home',
                    icon: HeroIcons.home,
                  ),
                  BottomNavBarItem(
                    index: 1,
                    isSelected: selectedPage == 1,
                    title: 'Jadwal',
                    icon: HeroIcons.clock,
                  ),
                  BottomNavBarItem(
                    index: 2,
                    isSelected: selectedPage == 2,
                    title: 'Bookmark',
                    icon: HeroIcons.bookmark,
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });

                  pageController.animateToPage(
                    selectedPage,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
                selectedIndex: selectedPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
