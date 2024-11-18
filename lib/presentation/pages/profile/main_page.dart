import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/pages/profile/methods/menu_list.dart';
import 'package:eventpass_app/presentation/pages/profile/methods/profile_header.dart';
import 'package:eventpass_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainProfilePage extends ConsumerWidget {
  const MainProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            profileHeader(context),
            menuList(context, ref, 'PARTICIPANT'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: primaryRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  await ref.read(userDataProvider.notifier).logout();
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
