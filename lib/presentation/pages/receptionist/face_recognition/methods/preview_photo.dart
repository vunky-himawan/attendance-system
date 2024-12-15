import 'dart:io';

import 'package:camera/camera.dart';
import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/pages/receptionist/face_recognition/face_recognition_page.dart';
import 'package:eventpass_app/presentation/providers/attendance_data/attendance_provider_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

class PreviewPhoto extends ConsumerStatefulWidget {
  final XFile photo;

  const PreviewPhoto({super.key, required this.photo});

  @override
  ConsumerState<PreviewPhoto> createState() => _PreviewPhotoState();
}

class _PreviewPhotoState extends ConsumerState<PreviewPhoto> {
  bool _isLoading = false;

  Future<void> _sendPhoto() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await ref.read(attendanceProvider.notifier).attendance(
            ref: ref,
            photo: widget.photo,
            context: context,
          );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal mengirim foto. Coba lagi!'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bottomBarHeight = screenSize.height * 0.15;

    return Scaffold(
      backgroundColor: ghostBlack,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              bottom: bottomBarHeight,
              child: Container(
                child: ClipRect(
                  child: Transform.scale(
                    scale: 1,
                    child: Image.file(
                      File(widget.photo.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: bottomBarHeight,
              child: Container(
                decoration: const BoxDecoration(
                  color: ghostBlack,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FaceRecognitionPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        child: const HeroIcon(
                          HeroIcons.xMark,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _sendPhoto,
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        child: const HeroIcon(
                          HeroIcons.paperAirplane,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (_isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
