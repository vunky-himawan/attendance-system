import 'package:eventpass_app/presentation/pages/user/methods/user_card.dart'; // UserPage import
import 'package:eventpass_app/presentation/widgets/bottom_nav_bar.dart';
import 'package:eventpass_app/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:go_router/go_router.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  ConsumerState<UserPage> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {
  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) => setState(() {
              selectedPage = value;
            }),
            children: const [
              Center(child: Text("Home Page")),
              Center(child: Text("Acara Page")),
              UserCardPage(), // Ganti teks dengan UserCardPage()
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
                  title: 'Acara',
                  icon: HeroIcons.calendar,
                ),
                BottomNavBarItem(
                  index: 2,
                  isSelected: selectedPage == 2,
                  title: 'Pengguna',
                  icon: HeroIcons.userGroup,
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
                  context.go('/profile'); // Redirect to profile route
                } else {
                  pageController.animateToPage(
                    selectedPage,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                }
              },
              selectedIndex: selectedPage,
            ),
          ),
        ],
      ),
    );
  }
}
