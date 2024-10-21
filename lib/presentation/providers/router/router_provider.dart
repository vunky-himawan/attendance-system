import 'package:eventpass_app/presentation/pages/admin/home/home_page.dart';
import 'package:eventpass_app/presentation/pages/admin/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: '/admin',
          name: 'admin',
          builder: (context, state) => const MainPage(),
          routes: [
            GoRoute(
              path: 'home',
              name: 'adminHome',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
      ],
      initialLocation: '/admin',
      debugLogDiagnostics: false,
    );
