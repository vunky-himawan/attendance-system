import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/attendance_data/attendance_provider_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class AttendanceWithPinPage extends ConsumerStatefulWidget {
  const AttendanceWithPinPage({super.key});

  @override
  ConsumerState<AttendanceWithPinPage> createState() =>
      AttendanceWithPinPageState();
}

class AttendanceWithPinPageState extends ConsumerState<AttendanceWithPinPage> {
  late final TextEditingController _pinController;
  late final FocusNode _pinFocusNode;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
    _pinFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final attendanceState = ref.watch(attendanceProvider);
    final attendanceNotifier = ref.read(attendanceProvider.notifier);

    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Masukkan PIN Pengunjung',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                verticalSpace(20),
                Pinput(
                  controller: _pinController,
                  focusNode: _pinFocusNode,
                  defaultPinTheme: defaultPinTheme,
                  length: 6,
                  onCompleted: (pin) {
                    attendanceNotifier.pinAttendanceConfirmation(
                        context: context, pin: pin, ref: ref);
                  },
                  validator: (pin) {
                    if (pin == null || pin.length != 6) {
                      return 'PIN harus 6 digit';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (attendanceState.error != null) {
                      attendanceNotifier.clearError();
                    }
                  },
                ),
                if (attendanceState.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      attendanceState.error ?? 'Terjadi kesalahan.',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
