import 'package:camera/camera.dart';
import 'package:eventpass_app/presentation/providers/auth/auth_provider_setup.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eventpass_app/presentation/providers/usecases/register/notifier/register_notifier.dart';
import 'package:image/image.dart' as img; // Tambahkan pustaka image

class TakeFacePhoto extends ConsumerStatefulWidget {
  const TakeFacePhoto({super.key});

  @override
  ConsumerState<TakeFacePhoto> createState() => _TakeFacePhotoState();
}

class _TakeFacePhotoState extends ConsumerState<TakeFacePhoto> {
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
      (camera) => camera.lensDirection == CameraLensDirection.front,
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
      final imageBytes = await _capturedPhoto.readAsBytes();
      final originalImage = img.decodeImage(imageBytes);
      final orientedImage = img.bakeOrientation(originalImage!);

      final orientedImagePath =
          _capturedPhoto.path.replaceFirst('.jpg', '_oriented.jpg');
      final orientedImageBytes = img.encodeJpg(orientedImage);
      final orientedImageFile = await XFile.fromData(
        orientedImageBytes,
        mimeType: 'image/jpeg',
        name: orientedImagePath.split('/').last,
        path: orientedImagePath,
      );
      await orientedImageFile.saveTo(orientedImagePath);

      final registerState = ref.read(registerProvider);

      final username = registerState.username;
      final password = registerState.password;
      final email = registerState.email;
      final selectedRole = registerState.selectedRole;

      if (username == null ||
          password == null ||
          email == null ||
          selectedRole == null) {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final updatedState = ref.read(registerProvider);

      await ref.read(authProvider.notifier).register(
            username: username,
            password: password,
            email: email,
            role: selectedRole,
            faceImage: orientedImageFile,
            participantRegisterParams: updatedState.participantParams,
          );
    } catch (e) {
      ref.watch(routerProvider).push('/error');
    } finally {
      setState(() {
        _isLoading = false;
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
          // Camera Preview with white border
          Positioned.fill(
            bottom: bottomBarHeight, // Leave space for bottom bar
            child: Container(
              child: ClipRect(
                child: Transform.scale(
                  scaleX: -1,
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
