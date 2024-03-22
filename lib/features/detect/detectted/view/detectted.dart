import 'package:flutter/material.dart';
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
            buildActionButton(Icons.camera_alt_rounded),
            buildActionButton(Icons.upload_file),
          ],
        ),
      ),
    );
  }
}
