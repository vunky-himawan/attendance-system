// import 'package:eventpass_app/presentation/pages/event/list_of_event/list_of_event_page.dart';
// import 'package:eventpass_app/presentation/pages/superadmin/home/home_page.dart';
// import 'package:eventpass_app/presentation/pages/superadmin/list_of_user/list_of_user_page.dart';
// import 'package:eventpass_app/presentation/widgets/bottom_nav_bar.dart';
// import 'package:eventpass_app/presentation/widgets/bottom_nav_bar_item.dart';
// import 'package:eventpass_app/presentation/widgets/user_info/user_info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:heroicons/heroicons.dart';

// class MainPage extends ConsumerStatefulWidget {
//   const MainPage({super.key});

//   @override
//   ConsumerState<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends ConsumerState<MainPage> {
//   PageController pageController = PageController();
//   int selectedPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             PageView(
//               controller: pageController,
//               onPageChanged: (value) => setState(
//                 () {
//                   selectedPage = value;
//                 },
//               ),
//               children: [
//                 const HomePage(),
//                 ListOfEventPage(
//                   isAdmin: false,
//                 ),
//                 const ListOfUserPage(),
//               ],
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: userInfo(context, ref),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: BottomNavBar(
//                 items: [
//                   BottomNavBarItem(
//                     index: 0,
//                     isSelected: selectedPage == 0,
//                     title: 'Home',
//                     icon: HeroIcons.home,
//                   ),
//                   BottomNavBarItem(
//                     index: 1,
//                     isSelected: selectedPage == 1,
//                     title: 'Acara',
//                     icon: HeroIcons.listBullet,
//                   ),
//                   BottomNavBarItem(
//                     index: 2,
//                     isSelected: selectedPage == 2,
//                     title: 'Pengguna',
//                     icon: HeroIcons.userGroup,
//                   ),
//                 ],
//                 onTap: (index) {
//                   selectedPage = index;

//                   pageController.animateToPage(
//                     selectedPage,
//                     duration: const Duration(milliseconds: 200),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 selectedIndex: 0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
