import 'package:animeacheck/features/detect/image/byEye/view/snakbar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


late List<CameraDescription> cameras;
late CameraController controller;

void takePicture(BuildContext context) async {
  try {
    XFile picture = await controller.takePicture();
    // Picture taken successfully, you can process or display it
    print('Picture taken: ${picture.path}');
  } catch (e) {
    print('Error taking picture: $e');
    // Show a SnackBar with the error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: buildSnackBar(context), // Pass context here
      ),
    );
  }
}
