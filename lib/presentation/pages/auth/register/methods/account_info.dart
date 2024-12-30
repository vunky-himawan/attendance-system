import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/auth/auth_provider_setup.dart';
import 'package:eventpass_app/presentation/providers/usecases/register/notifier/register_notifier.dart';
import 'package:eventpass_app/presentation/widgets/input/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountInfo extends ConsumerStatefulWidget {
  final bool isLastStep;

  const AccountInfo({super.key, this.isLastStep = false});

  @override
  ConsumerState<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends ConsumerState<AccountInfo> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
    _confirmPassword.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _usernameController.removeListener(_updateButtonState);
    _emailController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);
    _confirmPassword.removeListener(_updateButtonState);
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPassword.text.isNotEmpty &&
        _passwordController.text.length >= 8 &&
        _passwordController.text == _confirmPassword.text;
  }

  Future<void> _onNextPressed() async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (widget.isLastStep) {
        final registerState = ref.read(registerProvider);

        await ref.read(authProvider.notifier).register(
              username: _usernameController.text,
              password: _passwordController.text,
              email: _emailController.text,
              role: registerState.selectedRole!,
              eventOrganizerRegisterParams: registerState.organizerParams,
            );
      } else {
        ref.read(registerProvider.notifier).setAccountInfo(
              username: _usernameController.text,
              email: _emailController.text,
              password: _passwordController.text,
            );
        ref.read(registerProvider.notifier).nextStep();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Column(
                  children: [
                    Image(
                      image: AssetImage('assets/welcome.png'),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Buat Akun',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
                CustomTextField(
                  labelText: 'Username',
                  controller: _usernameController,
                  hintText: 'Username',
                ),
                verticalSpace(10),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  hintText: 'Email',
                ),
                verticalSpace(10),
                CustomTextField(
                  labelText: 'Kata Sandi',
                  controller: _passwordController,
                  hintText: 'Kata Sandi',
                  obscureText: true,
                ),
                verticalSpace(10),
                CustomTextField(
                  labelText: 'Konfirmasi Kata Sandi',
                  controller: _confirmPassword,
                  hintText: 'Konfirmasi Kata Sandi',
                  obscureText: true,
                ),
                verticalSpace(10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    minimumSize: const Size(double.infinity, 50),
                    disabledBackgroundColor: Colors.grey.shade200,
                    backgroundColor: darkBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: darkBlue,
                        width: 1,
                      ),
                    ),
                  ),
                  onPressed: (_isFormValid && !_isLoading)
                      ? () => _onNextPressed()
                      : null,
                  child: Text(
                    widget.isLastStep ? "Submit" : "Selanjutnya",
                    style: TextStyle(
                      color: _isFormValid ? Colors.white : Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        if (_isLoading)
          Container(
            color: Colors.white.withOpacity(0.5),
            child: Center(
              child: Card(
                color: Colors.white,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: ghostBlack, width: 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(
                        'Mohon tunggu...',
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
