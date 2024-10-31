import 'package:eventpass_app/presentation/pages/admin/home/home_page.dart'
    as admin_home_page;
import 'package:eventpass_app/presentation/pages/admin/main_page.dart'
    as admin_main_page;
import 'package:eventpass_app/presentation/pages/event/event_main_page.dart'
    as event_main_page;
import 'package:eventpass_app/presentation/pages/login/login_page.dart';
import 'package:eventpass_app/presentation/pages/notification/notification_page.dart';
import 'package:eventpass_app/presentation/pages/welcome/welcome_page.dart';
import 'package:eventpass_app/presentation/pages/status/success_page.dart';
import 'package:eventpass_app/presentation/pages/status/error_page.dart';
import 'package:eventpass_app/presentation/providers/router/auth/auth_routes.dart';
import 'package:eventpass_app/presentation/providers/router/event_organizer/event_organizer_routes.dart';
import 'package:eventpass_app/presentation/providers/router/participant/participant_routes.dart';
import 'package:eventpass_app/presentation/providers/router/receptionist/receptionist_routes.dart';
import 'package:eventpass_app/presentation/providers/router/superadmin/superadmin_routes.dart';
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
          path: '/event',
          name: 'event',
          builder: (context, state) => const event_main_page.EventPage(),
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
        ...superadminRoutes,
        ...eventOrganizerRoutes,
        ...receptionistRoutes,
        ...participantRoutes,
        ...authRoutes,
        GoRoute(
          path: '/success',
          name: 'success',
          builder: (context, state) => const SuccessPage(),
        ),
        GoRoute(
          path: '/error',
          name: 'error',
          builder: (context, state) => const ErrorPage(),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
            ),
            body: const Center(
              child: Text('Profile'),
            ),
          ),
        ),
      ],
      initialLocation: '/participant/checkout',
      debugLogDiagnostics: true,
    );
