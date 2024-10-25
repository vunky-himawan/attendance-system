import 'package:eventpass_app/presentation/pages/pengunjung/home/home_page.dart';
import 'package:eventpass_app/presentation/widgets/bottom_nav_bar.dart';
import 'package:eventpass_app/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:go_router/go_router.dart';

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
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) => setState(
              () {
                selectedPage = value;
              },
            ),
            children: const [
              Center(
                child: HomePage(),
              ),
              // Add placeholders or actual pages for Jadwal, Bookmark, and Profil
              Center(child: Text("Jadwal Page")),
              Center(child: Text("Bookmark Page")),
              Center(child: Text("Profil Page")),
            ],
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
                  BottomNavBarItem(
                    index: 3,
                    isSelected: selectedPage == 3,
                    title: 'Profil',
                    icon: HeroIcons.user,
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });

                  if (index == 3) {
                    context.go('/profile');
                  } else {
                    pageController.animateToPage(
                      selectedPage,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                selectedIndex: selectedPage),
          ),
        ],
      ),
    );
  }
}
