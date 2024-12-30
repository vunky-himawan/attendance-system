import 'package:eventpass_app/infrastructure/config/app_config.dart';
import 'package:eventpass_app/presentation/pages/profile/main_page.dart';
import 'package:eventpass_app/presentation/providers/auth/auth_provider_setup.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget userInfo(BuildContext context, WidgetRef ref,
    {bool withNotification = true, bool withLogout = false}) {
  final userState = ref.watch(authProvider);

  if (userState.isLoading) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  final user = userState.user;

  return Container(
    color: Colors.white,
    height: 100,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ProfileMainPage();
              },
            ),
          );
        },
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: user?.photoUrl != null
                      ? NetworkImage(
                              '${AppConfig.assetBaseUrl}/${user!.photoUrl}')
                          as ImageProvider
                      : const AssetImage('assets/male.png') as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.username ?? 'Username',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!withNotification && withLogout)
                    const SizedBox(
                      width: 64,
                      height: 64,
                      child: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                    ),
                  if (withNotification)
                    GestureDetector(
                      onTap: () {
                        ref.watch(routerProvider).push('/notification');
                      },
                      child: Container(
                        width: 64,
                        height: 64,
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
