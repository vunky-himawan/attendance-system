import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/widgets/input/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddReceptionistPage extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  AddReceptionistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Tambah Penerima Tamu',
          style: TextStyle(
            color: ghostBlack,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextField(
                  labelText: 'Nama Lengkap',
                  controller: _fullNameController,
                  hintText: 'Nama Lengkap',
                ),
                verticalSpace(16),
                CustomTextField(
                  labelText: 'Username',
                  controller: _userNameController,
                  hintText: 'Username',
                ),
                verticalSpace(16),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  hintText: 'example@example.com',
                ),
                verticalSpace(16),
                CustomTextField(
                  labelText: 'Kata Sandi',
                  controller: _passwordController,
                  obscureText: true,
                  hintText: '********',
                ),
                verticalSpace(16),
                CustomTextField(
                  labelText: 'Konfirmasi Kata Sandi',
                  controller: _confirmPasswordController,
                  obscureText: true,
                  hintText: '********',
                ),
                verticalSpace(16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add save functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Set corner radius
                      ),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
