import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorPage extends ConsumerStatefulWidget {
  final bool isAttendance;
  final String? message;
  final String redirectTo;

  const ErrorPage({
    super.key,
    required this.isAttendance,
    required this.redirectTo,
    this.message = "Terjadi kesalahan",
  });

  @override
  ConsumerState<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends ConsumerState<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Centered content
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Red circle with "X" icon
                  _buildErrorIcon(),
                  verticalSpace(20),
                  Text(
                    widget.message ?? 'Terjadi kesalahan',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom content
          _buildBottomContent(context),
        ],
      ),
    );
  }

  Widget _buildErrorIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
        const Icon(
          Icons.close,
          color: Colors.white,
          size: 60,
        ),
      ],
    );
  }

  Widget _buildBottomContent(BuildContext context) {
    return Column(
      children: [
        // Bottom navigation bar with "Absen PIN" button
        !widget.isAttendance
            ? const SizedBox()
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner, color: Colors.black),
                    SizedBox(width: 8),
                    Text(
                      'Absen PIN',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
        // 'Kembali' button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: darkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                ref.watch(routerProvider).go(widget.redirectTo);
              },
              child: const Text(
                "Kembali",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
