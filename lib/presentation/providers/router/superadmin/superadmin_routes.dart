import 'package:eventpass_app/presentation/pages/superadmin/list_of_user/list_of_user_page.dart';
import 'package:eventpass_app/presentation/pages/superadmin/main_page.dart';
import 'package:eventpass_app/presentation/pages/superadmin/home/home_page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> superadminRoutes = [
  GoRoute(
    path: '/superadmin',
    name: 'superadmin',
    builder: (context, state) => const MainPage(),
    routes: [
      GoRoute(
        path: 'home',
        name: 'superadmin_home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: 'users',
        name: 'superadmin_users',
        builder: (context, state) => const ListOfUserPage(),
      ),
    ],
  ),
];
