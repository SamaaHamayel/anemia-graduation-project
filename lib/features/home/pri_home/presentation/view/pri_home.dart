import 'package:flutter/material.dart';
import 'package:animeacheck/features/detect/detectted/view/detectted.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/appColors/app_colors.dart';
import '../../data/widget/build_feature_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PriHome extends StatelessWidget {
  const PriHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
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
              child:  Text(
                AppLocalizations.of(context)!.homeScreenSubTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            buildFeatureCard(
              icon: Icons.camera_alt_rounded,
              title: AppLocalizations.of(context)!.detectAnemia,
              description:
                  AppLocalizations.of(context)!.detectAnemiaTitle,
              onTap: () => _navigateToDetectedScreen(context),
            ),
            buildFeatureCard(
              icon: Icons.biotech,
              title: AppLocalizations.of(context)!.testResults,
              description:
                  AppLocalizations.of(context)!.testResultsTitle,
              onTap: () => _navigateToDetectedScreen(context),
            ),
            buildFeatureCard(
              icon: Icons.person_search_rounded,
              title: AppLocalizations.of(context)!.consultADoctor,
              description:
                  AppLocalizations.of(context)!.consultADoctorTitle,
              onTap: () => _navigateToDetectedScreen(context),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetectedScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetectedScreen()),
    );
  }

}
