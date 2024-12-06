import 'package:eventpass_app/presentation/pages/participant/checkout/checkout_page.dart';
import 'package:eventpass_app/presentation/pages/profile/profile-update/profile_update_page.dart';
import 'package:eventpass_app/presentation/pages/profile/digital-tickets/digital_tickets_page.dart'; 
import 'package:eventpass_app/presentation/pages/profile/change-password/change_password_page.dart';
import 'package:eventpass_app/presentation/pages/participant/home/home_page.dart';
import 'package:eventpass_app/presentation/pages/participant/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> participantRoutes = [
  GoRoute(
    path: '/participant',
    name: 'participant',
    builder: (context, state) => const MainPage(),
    routes: [
      GoRoute(
        path: 'home',
        name: 'participant_home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: 'checkout',
        name: 'participant_checkout',
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: 'top-up',
        name: 'participant_top-up',
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Top Up'),
          ),
          body: const Center(
            child: Text('Top Up'),
          ),
        ),
      ),
      GoRoute(
        path: 'digital-tickets',
        name: 'participant_digital_tickets',
        builder: (context, state) => DigitalTicketsPage(),
      ),
      GoRoute(
        path: 'profile-update',
        name: 'participant_profile_update',
        builder: (context, state) => const ProfileUpdatePage(),
      ),
       GoRoute(
          path: 'change-password',
          name: 'participant_change_password',
          builder: (context, state) => const ChangePasswordPage(),
        ),
    ],
  ),
];
