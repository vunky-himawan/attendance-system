import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:eventpass_app/presentation/widgets/input/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userDataProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  SizedBox(height: 20), // Menambahkan ruang antar elemen
                  Text(
                    'Masuk',
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
              verticalSpace(10),
              if (userState.hasError) ...[
                Center(
                  child: Text(
                    userState.error!.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ],
              verticalSpace(40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    labelText: 'Username',
                    controller: _usernameController,
                    hintText: 'Masukkan Username',
                  ),
                  verticalSpace(16),
                  CustomTextField(
                    labelText: 'Kata Sandi',
                    controller: _passwordController,
                    obscureText: true,
                    hintText: 'Masukkan Kata Sandi',
                  ),
                  verticalSpace(25), // Beri jarak sebelum tombol masuk
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      final username = _usernameController.text.trim();
                      final password = _passwordController.text;

                      // Validasi input
                      final errorMessage =
                          validateCredentials(username, password);
                      if (errorMessage != null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: Text(errorMessage),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                        return;
                      }

                      // Jika validasi berhasil, panggil login
                      ref
                          .read(userDataProvider.notifier)
                          .login(username: username, password: password);
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Fungsi untuk memvalidasi username dan password
  String? validateCredentials(String username, String password) {
    if (username.isEmpty || username.length < 3) {
      return 'Username harus minimal 3 karakter.';
    }
    if (password.isEmpty || password.length < 8) {
      return 'Password harus minimal 8 karakter.';
    }
    return null; // Tidak ada error
  }
}
