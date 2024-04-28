import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../gallery/data/widget/detect_anemia_by_image.dart';
import '../data/widget/build_icon_button.dart';
import '../data/widget/take_packer.dart';

class DetectAnemiaByEye extends StatefulWidget {
  const DetectAnemiaByEye({Key? key});

  @override
  State<DetectAnemiaByEye> createState() => DetectAnemiaByEyeState();
}

class DetectAnemiaByEyeState extends State<DetectAnemiaByEye> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 208),
            child: Container(
              color: AppColors.lightBlackColor,
              child: Center(
                child: Image.asset(
                  'lib/core/utils/appImages/images/detect.png',
                ),
              ),
            ),
          ),
          Container(
            height: 110,
            //color: AppColors.lightPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildIconButton(
                    icon: Icons.image,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetectAnemiaByImage(),
                        ),
                      );
                    },
                  ),
                  buildIconButton(
                    icon: Icons.circle_outlined,
                    onPressed: () {
                      takePicture(context);
                      // Handle circle button press
                    },
                  ),
                  buildIconButton(
                    icon: Icons.refresh_sharp,
                    onPressed: () {
                      setState(() {});
                      // Handle refresh button press
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
