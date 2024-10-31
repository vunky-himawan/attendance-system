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
      initialLocation: '/',
      debugLogDiagnostics: true,
    );
