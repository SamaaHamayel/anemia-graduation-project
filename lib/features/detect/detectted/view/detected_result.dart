import 'package:flutter/material.dart';

class DetectedImage extends StatelessWidget {
  final String message;
  final String predictedClass;

  const DetectedImage(
      {super.key, required this.message, required this.predictedClass});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: 30,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 25),
            Text(
              predictedClass,
              style:  TextStyle(
                fontSize: 30,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
