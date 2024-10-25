import 'package:eventpass_app/presentation/pages/admin/home/home_page.dart'
    as admin_home_page;
import 'package:eventpass_app/presentation/pages/admin/main_page.dart'
    as admin_main_page;
import 'package:eventpass_app/presentation/pages/notification/notification_page.dart';
import 'package:eventpass_app/presentation/pages/superadmin/main_page.dart'
    as superadmin_main_page;
import 'package:eventpass_app/presentation/pages/superadmin/home/home_page.dart'
    as superadmin_home_page;
import 'package:eventpass_app/presentation/pages/profile_event_organizer/main_page.dart'
    as profile_event_organizer_main_page;
import 'package:eventpass_app/presentation/pages/welcome/welcome_page.dart';
import 'package:eventpass_app/presentation/pages/pengunjung/main_page.dart'
    as pengunjung_main_page;
import 'package:eventpass_app/presentation/pages/checkout/checkout_page.dart'
    as checkout_main_page; // Perbaikan Import
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'welcome',
          builder: (context, state) => const WelcomePage(),
        ),
        GoRoute(
          path: '/admin',
          name: 'admin',
          builder: (context, state) => const admin_main_page.MainPage(),
          routes: [
            GoRoute(
              path: 'home',
              name: 'adminHome',
              builder: (context, state) => const admin_home_page.HomePage(),
            ),
          ],
        ),
        GoRoute(
          path: '/superadmin',
          name: 'superadmin',
          builder: (context, state) => const superadmin_main_page.MainPage(),
          routes: [
            GoRoute(
              path: 'home',
              name: 'superadminHome',
              builder: (context, state) =>
                  const superadmin_home_page.HomePage(),
            ),
          ],
        ),
        GoRoute(
          path: '/pengunjung',
          name: 'pengunjung',
          builder: (context, state) => const pengunjung_main_page.MainPage(),
          routes: [
            GoRoute(
              path: 'home',
              name: 'PengunjungHome',
              builder: (context, state) =>
                  const superadmin_home_page.HomePage(),
            ),
          ],
        ),
        GoRoute(
          path: '/notification',
          name: 'notification',
          builder: (context, state) => const NotificationPage(),
        ),
        GoRoute(
          path: '/event-organizer/details',
          name: 'eventOrganizerDetails',
          builder: (context, state) =>
              const profile_event_organizer_main_page.MainPage(),
        ),
        GoRoute(
          path: '/checkout',
          name: 'checkout',
          builder: (context, state) =>
              const checkout_main_page.CheckoutPage(), // Halaman checkout utama
        ),
      ],
      initialLocation: '/checkout',
      debugLogDiagnostics: false,
    );
