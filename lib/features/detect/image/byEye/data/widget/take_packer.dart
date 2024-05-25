import 'dart:developer';

import 'package:animeacheck/features/detect/image/byEye/view/snakbar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../view/loading.dart';

late List<CameraDescription> cameras;
late CameraController controller;

void takePicture(BuildContext context) async {
  try {
    XFile picture = await controller.takePicture();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: buildLoading(context), // Pass context here
        ),
      );
    }
  } catch (e) {
    log('Error taking picture: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: buildSnackBar(context), // Pass context here
        ),
      );
    }
  }
}
