import 'package:eventpass_app/presentation/pages/admin/home/home_page.dart'
    as admin_home_page;
import 'package:eventpass_app/presentation/pages/admin/main_page.dart'
    as admin_main_page;
import 'package:eventpass_app/presentation/pages/login/login_page.dart';
import 'package:eventpass_app/presentation/pages/notification/notification_page.dart';
import 'package:eventpass_app/presentation/pages/superadmin/main_page.dart'
    as superadmin_main_page;
import 'package:eventpass_app/presentation/pages/superadmin/home/home_page.dart'
    as superadmin_home_page;
import 'package:eventpass_app/presentation/pages/profile_event_organizer/main_page.dart'
    as user_main_page; // Perbaikan Import
import 'package:eventpass_app/presentation/pages/user/user_page.dart'; // UserPage import
import 'package:eventpass_app/presentation/pages/user/methods/user_card.dart'; // UserCard import
import 'package:eventpass_app/presentation/pages/welcome/welcome_page.dart';
import 'package:eventpass_app/presentation/pages/pengunjung/main_page.dart'
    as pengunjung_main_page;
import 'package:eventpass_app/presentation/pages/checkout/checkout_page.dart'
    as checkout_main_page; // Perbaikan Import
import 'package:eventpass_app/presentation/pages/receptionist/home/home_page.dart'
    as receptionist_home_page;
import 'package:eventpass_app/presentation/pages/verifikasi/success_page.dart'; // Import SuccessPage
import 'package:flutter/material.dart';
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
          path: '/receptionist',
          name: 'receptionist',
          builder: (context, state) => const receptionist_home_page.HomePage(),
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
              const user_main_page.MainPage(), // Sesuaikan rute ini jika diperlukan
        ),
        GoRoute(
          path: '/checkout',
          name: 'checkout',
          builder: (context, state) =>
              const checkout_main_page.CheckoutPage(), // Halaman checkout utama
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/user', // Rute untuk halaman UserPage
          name: 'user',
          builder: (context, state) => const UserPage(), // Menampilkan UserPage
        ),
         GoRoute(
          path: '/success', // Route for SuccessPage
          name: 'success',
          builder: (context, state) => const SuccessPage(), // Displays SuccessPage
        ),
      ],
      initialLocation: '/success',
      debugLogDiagnostics: true,
    );
