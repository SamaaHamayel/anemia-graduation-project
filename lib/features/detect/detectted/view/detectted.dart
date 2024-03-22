import 'package:animeacheck/features/detect/image/byEye/view/Detect_anemia_by_eye.dart';
import 'package:animeacheck/features/detect/image/gallery/view/detect_anemia_by_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/utils/appColors/app_colors.dart';
import '../data/widgets/build_action_button.dart';
import '../data/widgets/build_detected_info.dart';
import '../data/widgets/build_header.dart';

class DetectedScreen extends StatelessWidget {
  const DetectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 150.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildHeader(context),
            buildDetectedInfo(),
            buildActionButton(iconData: Icons.camera_alt_rounded, onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetectAnemiaByEye()),
                    )),
            buildActionButton(
                iconData: Icons.upload_file,
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetectAnemiabyimage()),
                    ))
          ],
        ),
      ),
    );
  }
}
