import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/receptionist/attendance/attendance_data_provider.dart';
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
    _pinFocusNode = FocusNode();
    _pinController = TextEditingController();

    _pinController.addListener(() {
      final currentError = ref.read(attendanceDataProvider).error;
      if (currentError != null) {
        ref.read(attendanceDataProvider.notifier).clearError();
      }
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final attendanceState = ref.watch(attendanceDataProvider);

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
          child: Container(
            child: Material(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Masukkan PIN Pengunjung'),
                  verticalSpace(20),
                  Pinput(
                    controller: _pinController,
                    focusNode: _pinFocusNode,
                    defaultPinTheme: defaultPinTheme,
                    length: 6,
                    onCompleted: (pin) {
                      ref
                          .watch(attendanceDataProvider.notifier)
                          .pinAttendanceConfirmation(
                            context,
                            pin,
                          );
                    },
                    validator: (pin) {
                      if (pin!.length != 6) {
                        return 'PIN harus 6 digit';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      ref.read(attendanceDataProvider.notifier).clearError();
                    },
                  ),
                  if (attendanceState.hasError)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        attendanceState.error!.toString(),
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
