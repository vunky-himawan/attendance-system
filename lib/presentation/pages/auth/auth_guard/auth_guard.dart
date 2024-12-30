import 'package:eventpass_app/presentation/pages/auth/login/login_page.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/main_page.dart';
import 'package:eventpass_app/presentation/pages/participant/main_page.dart';
import 'package:eventpass_app/presentation/pages/receptionist/home/home_page.dart';
import 'package:eventpass_app/presentation/providers/auth/auth_provider_setup.dart';
import 'package:eventpass_app/utils/decode_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class AuthGuard extends ConsumerStatefulWidget {
  const AuthGuard({super.key});

  @override
  ConsumerState<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends ConsumerState<AuthGuard> {
  Future<Map<String, dynamic>?> _decodeToken(String token) async {
    try {
      return await decodeToken(token);
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).initializeUserFromToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: storage.read(key: 'token'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        final token = snapshot.data;

        if (token == null) {
          return LoginPage();
        }

        return FutureBuilder<Map<String, dynamic>?>(
          future: _decodeToken(token),
          builder: (context, decodeSnapshot) {
            if (decodeSnapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Container(
                  color: Colors.white,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }

            if (decodeSnapshot.hasError || decodeSnapshot.data == null) {
              return LoginPage();
            }

            final authState = ref.watch(authProvider);

            if (authState.isLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (authState.user == null) {
              return LoginPage();
            }

            if (authState.user!.role == 'PARTICIPANT') {
              return const ParticipantMainPage();
            } else if (authState.user!.role == 'EVENT_ORGANIZER') {
              return const EventOrganizerMainPage();
            } else if (authState.user!.role == 'RECEPTIONIST') {
              return const ReceptionistHomePage();
            } else if (authState.user!.role == 'SUPERADMIN') {
              return const Placeholder();
            } else {
              return const Center(child: Text('Invalid role'));
            }
          },
        );
      },
    );
  }
}
