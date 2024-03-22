
import 'package:camera/camera.dart';
late List<CameraDescription> cameras;
late CameraController controller;


void initializeCamera() async {
  cameras = await availableCameras();
  controller = CameraController(cameras[0], ResolutionPreset.medium);

  await controller.initialize();
}


