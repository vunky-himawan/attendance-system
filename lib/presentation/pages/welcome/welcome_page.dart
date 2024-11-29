import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Image(
                    image: AssetImage('assets/welcome.png'),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Eventpass',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: darkBlue),
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      ref.watch(routerProvider).pushNamed('register');
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(color: ghostBlack),
                    ),
                  ),
                  verticalSpace(20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      ref.watch(routerProvider).pushNamed('login');
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
