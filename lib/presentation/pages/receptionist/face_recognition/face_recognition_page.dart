import 'package:camera/camera.dart';
import 'package:eventpass_app/presentation/pages/receptionist/face_recognition/methods/preview_photo.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;

class FaceRecognitionPage extends ConsumerStatefulWidget {
  const FaceRecognitionPage({super.key});

  @override
  ConsumerState<FaceRecognitionPage> createState() =>
      _FaceRecognitionPageState();
}

class _FaceRecognitionPageState extends ConsumerState<FaceRecognitionPage> {
  late CameraController _cameraController;
  bool _isCameraInitialized = false;
  late XFile _capturedPhoto;
  bool _isLoading = false; // Tambahkan variabel untuk indikator loading

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
      orElse: () => cameras.first,
    );
    _cameraController = CameraController(frontCamera, ResolutionPreset.high);
    try {
      await _cameraController.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    if (!_isCameraInitialized) return;

    setState(() {
      _isLoading = true;
    });

    try {
      _capturedPhoto = await _cameraController.takePicture();
      if (_capturedPhoto == null) {
        print("Error: Captured photo is null");
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Fix the image orientation
      final imageBytes = await _capturedPhoto.readAsBytes();
      final originalImage = img.decodeImage(imageBytes);
      final orientedImage = img.bakeOrientation(originalImage!);

      // Save the oriented image to a file
      final orientedImagePath =
          _capturedPhoto.path.replaceFirst('.jpg', '_oriented.jpg');
      final orientedImageBytes = img.encodeJpg(orientedImage);
      final orientedImageFile = XFile.fromData(
        orientedImageBytes,
        mimeType: 'image/jpeg',
        name: orientedImagePath.split('/').last,
        path: orientedImagePath,
      );
      await orientedImageFile.saveTo(orientedImagePath);

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewPhoto(photo: orientedImageFile),
          ),
        );
      }
    } catch (e) {
      ref.watch(routerProvider).push('/error');
    } finally {
      setState(() {
        _isLoading = false; // Sembunyikan indikator loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    final screenSize = MediaQuery.of(context).size;
    final bottomBarHeight = screenSize.height * 0.15; // 15% of screen height

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            bottom: bottomBarHeight,
            child: Container(
              child: ClipRect(
                child: Transform.scale(
                  scaleX: 1,
                  child: CameraPreview(_cameraController),
                ),
              ),
            ),
          ),

          // Bottom bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: bottomBarHeight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Camera capture button
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _isLoading ? null : _takePhoto,
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
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 32,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Loading overlay
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
    );
  }
}
