import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/appColors/app_colors.dart';

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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 324,
          height: 308,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 71,
                top: 91,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'We can’t reach \nyour eyelid',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Kodchasan',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 32),
                    GestureDetector(
                        onTap: () {
                          // Add your onPressed logic here
                          print('Try Again button pressed');
                        },
                        child: TextButton(
                          onPressed: () {
                            Navigator.popUntil(context,
                                ModalRoute.withName('/DetectAnemiaByEye'));

                            // Add your onPressed logic here
                          },
                          child: Text(
                            'Try Again',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFEA4335),
                              fontSize: 24,
                              fontFamily: 'Kodchasan',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Positioned(
                  left: 16,
                  top: 16,
                  child: TextButton(
                    onPressed: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName('/DetectAnemiaByEye'));

                      // Add your onPressed logic here
                    },
                    child: Text(
                      ' x ',
                      style: TextStyle(
                        fontSize: 30,
                        color: AppColors.lightPrimaryColor,
                        // Add your text style properties here
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    )));
  }
}
