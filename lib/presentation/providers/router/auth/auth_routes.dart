import 'package:eventpass_app/presentation/pages/auth/login/login_page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> authRoutes = [
  GoRoute(
    path: '/login',
    name: 'login',
    builder: (context, state) => LoginPage(),
  ),
];
