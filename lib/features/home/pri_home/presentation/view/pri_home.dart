import 'package:flutter/material.dart';
import 'package:animeacheck/features/detect/detectted/view/detectted.dart';
import '../../../../../core/utils/appColors/app_colors.dart';
import '../../../../test/view/presentation/explana.dart';
import '../../data/widget/build_feature_card.dart';

class PriHome extends StatelessWidget {
  const PriHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome, Sarah',
              style: TextStyle(
                color: AppColors.lightPrimaryColor,
                fontSize: 18,
                fontFamily: 'Kodchasan',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 351,
              child: Text(
                'Start your journey towards better health now.',
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
              title: 'Detect Anemia',
              description:
                  'You can take or upload photo for your eyelid to know whether you have anemia or not',
              onTap: () => navigateToDetectedScreen(context),
            ),
            buildFeatureCard(
              icon: Icons.biotech,
              title: 'Test Results',
              description:
                  'Input the required test results to accurately determine the type of anemia you are suffering from.',
              onTap: () =>  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => explanaScreen()),
    )
         
            ),
            buildFeatureCard(
              icon: Icons.person_search_rounded,
              title: 'Consult a Doctor',
              description:
                  'Enter your location to discover nearby doctors, and schedule an appointment effortlessly.',
              onTap: () => navigateToDetectedScreen(context),
            ),
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
