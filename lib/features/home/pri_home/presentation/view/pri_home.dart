import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/core/utils/appString/app_strings.dart';
import 'package:animeacheck/features/home/doctor/presentation/view/doctor.dart';
import 'package:animeacheck/features/home/notification/presentation/view/no_notification.dart';
import 'package:animeacheck/features/home/notification/presentation/view/notification.dart';
import 'package:animeacheck/features/test/view/presentation/explana.dart';
import 'package:flutter/material.dart';
import 'package:animeacheck/features/detect/detectted/view/detectted.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/appColors/app_colors.dart';
import '../../data/widget/build_feature_card.dart';

class PriHome extends StatefulWidget {
  const PriHome({Key? key});

  @override
  State<PriHome> createState() => _PriHomeState();
}

class _PriHomeState extends State<PriHome> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.lightPrimaryColor,
              child: Image.asset(
                AppAssets.female,
                width: double.infinity,
              ),
            ),
            Image.asset(
              'lib/core/utils/appImages/images/logo (2).png',
              scale: 2,
            ),
            IconButton(
              onPressed: () {
                if (isSwitched == true)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => notificationScreen()),
                  );
                else
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => noNotificationScreen()),
                  );
              },
              icon: Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
                size: 30.0,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Welcome, Sarah',
              style: TextStyle(
                color: AppColors.lightPrimaryColor,
                fontSize: 18,
                fontFamily: 'Kodchasan',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 351.w,
              child: const Text(
                AppStrings.homeScreenSubTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            buildFeatureCard(
              icon: Icons.camera_alt_rounded,
              title: AppStrings.detectAnemia,
              description: AppStrings.detectAnemiaTitle,
              onTap: () => navigateToDetectedScreen(context),
            ),
            buildFeatureCard(
                icon: Icons.biotech,
                title: AppStrings.testResults,
                description: AppStrings.testResultsTitle,
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => explanaScreen()),
                      )
                    }),
            buildFeatureCard(
                icon: Icons.person_search_rounded,
                title: AppStrings.consultADoctor,
                description: AppStrings.consultADoctorTitle,
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => doctorScreen()),
                      )
                    }),
          ],
        ),
      ),
    );
  }

  void navigateToDetectedScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetectedScreen()),
    );
  }
}
