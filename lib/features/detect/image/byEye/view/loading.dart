import 'dart:async';

import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildloading(BuildContext context) {
  // Pass context as a parameter
  return  Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 300.0, horizontal: 50),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
          child: RotatingIcon(),
        ),
                const SizedBox(height: 32),
                const Text(
                  'Please wait....',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF2BB598),
                    fontSize: 32,
                    fontFamily: 'Kodchasan',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class RotatingIcon extends StatefulWidget {
  @override
  RotatingIconState createState() => RotatingIconState();
}

class RotatingIconState extends State<RotatingIcon> {
  double rotationAngle = 0.0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      setState(() {
        rotationAngle += 0.05; // Adjust rotation speed as needed
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAngle,
      child: const Icon(
        Icons.donut_large,
        size: 100,
        color: AppColors.lightPrimaryColor,
      ),
    );
  }
}

  


