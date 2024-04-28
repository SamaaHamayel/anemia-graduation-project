 import 'package:flutter/material.dart';

Widget buildDetectedInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Image.asset(
              'lib/core/utils/appImages/images/detect.png',
              scale: 1,
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: 333,
              child: Text(
                'You can take or upload a photo of your eyelid to determine whether you have anemia or not',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

