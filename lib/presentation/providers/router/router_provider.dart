import 'package:eventpass_app/presentation/pages/notification/notification_page.dart';
import 'package:eventpass_app/presentation/pages/profile/main_page.dart';
import 'package:eventpass_app/presentation/pages/welcome/welcome_page.dart';
import 'package:eventpass_app/presentation/pages/status/success_page.dart';
import 'package:eventpass_app/presentation/pages/status/error_page.dart';
import 'package:eventpass_app/presentation/providers/router/auth/auth_routes.dart';
import 'package:eventpass_app/presentation/providers/router/event_organizer/event_organizer_routes.dart';
import 'package:eventpass_app/presentation/providers/router/participant/participant_routes.dart';
import 'package:eventpass_app/presentation/providers/router/receptionist/receptionist_routes.dart';
import 'package:eventpass_app/presentation/providers/router/superadmin/superadmin_routes.dart';
import 'package:eventpass_app/presentation/pages/profile/wallets/wallet_page.dart';
import 'package:eventpass_app/presentation/pages/profile/profile-update/profile_update_page.dart';
import 'package:eventpass_app/presentation/pages/profile/change-password/change_password_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

const FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future<bool> isAuthenticated() async {
  final token = await secureStorage.read(key: 'token');
  return token != null;
}

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
        // ...superadminRoutes,
        // ...eventOrganizerRoutes,
        ...receptionistRoutes,
        // ...participantRoutes,
        ...authRoutes,
        GoRoute(
          path: '/profile-update',
          name: 'profileUpdate',
          builder: (context, state) => const ProfileUpdatePage(),
        ),
        GoRoute(
          path: '/digital-tickets',
          name: 'digitalTickets',
          builder: (context, state) => const WalletPage(),
        ),
        GoRoute(
          path: '/change-password',
          name: 'change-password',
          builder: (context, state) => const ChangePasswordPage(),
        ),
        GoRoute(
          path: '/success',
          name: 'success',
          builder: (context, state) {
            final Map<String, dynamic> extra =
                state.extra as Map<String, dynamic>;
            final redirectTo = extra['redirectTo'] as String;
            final message = extra['message'] as String?;
            final buttonText = extra['buttonText'] as String;
            return SuccessPage(
              redirectTo: redirectTo,
              buttonText: buttonText,
              message: message,
            );
          },
        ),
        GoRoute(
          path: '/error',
          name: 'error',
          builder: (context, state) {
            final Map<String, dynamic> extra =
                state.extra as Map<String, dynamic>;
            final isAttendance = extra['isAttendance'] as bool;
            final message = extra['message'] as String?;
            final redirectTo = extra['redirectTo'] as String;
            return ErrorPage(
              isAttendance: isAttendance,
              message: message,
              redirectTo: redirectTo,
            );
          },
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => const ProfileMainPage(),
        ),
      ],
      // redirect: (context, state) async {
      //   // Periksa apakah pengguna sudah login dengan memeriksa token
      //   final bool isLoggedIn = await AuthGuard.isAuthenticated();
      //   final String? role = await AuthGuard.getRoleFromToken();

      //   // Jika belum login dan mencoba mengakses halaman selain login atau welcome, arahkan ke login
      //   final isLoggingIn = state.uri.path == '/login' || state.uri.path == '/';
      //   if (!isLoggedIn && !isLoggingIn) {
      //     return '/login';
      //   }

      //   // Jika sudah login, arahkan langsung ke dashboard
      //   if (isLoggedIn && role != null) {
      //     if (state.uri.path == '/') {
      //       switch (role) {
      //         case 'RECEPTIONIST':
      //           return '/receptionist/dashboard';
      //         case 'EVENT_ORGANIZER':
      //           return '/event-organizer/dashboard';
      //         case 'SUPERADMIN':
      //           return '/superadmin/dashboard';
      //         case 'PARTICIPANT':
      //           return '/participant/dashboard';
      //         default:
      //           return '/'; // Jika role tidak dikenali
      //       }
      //     }
      //   }

      //   return null;
      // },
      debugLogDiagnostics: true,
    );
