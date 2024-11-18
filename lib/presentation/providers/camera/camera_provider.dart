import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraControllerProvider = Provider<CameraController?>((ref) => null);

final initializeCameraProvider = FutureProvider<CameraController>((ref) async {
  final cameras = await availableCameras();
  final cameraController = CameraController(
    cameras.first,
    ResolutionPreset.high,
  );
  await cameraController.initialize();
  ref.onDispose(() {
    cameraController.dispose();
  });
  return cameraController;
});
