import 'package:eventpass_app/presentation/pages/receptionist/home/home_page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> receptionistRoutes = [
  GoRoute(
    path: '/receptionist',
    name: 'receptionist',
    builder: (context, state) => const ReceptionistHomePage(),
  ),
];
