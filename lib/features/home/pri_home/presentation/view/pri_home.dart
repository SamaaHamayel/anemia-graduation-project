import 'package:flutter/material.dart';
import 'package:animeacheck/features/detect/detectted/view/detectted.dart';
import '../../../../../core/utils/appColors/app_colors.dart';

class PriHome extends StatelessWidget {
  const PriHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            _buildFeatureCard(
              icon: Icons.camera_alt_rounded,
              title: 'Detect Anemia',
              description:
                  'You can take or upload photo for your eyelid to know whether you have anemia or not',
              onTap: () => _navigateToDetectedScreen(context),
            ),
            _buildFeatureCard(
              icon: Icons.biotech,
              title: 'Test Results',
              description:
                  'Input the required test results to accurately determine the type of anemia you are suffering from.',
              onTap: () => _navigateToDetectedScreen(context),
            ),
            _buildFeatureCard(
              icon: Icons.person_search_rounded,
              title: 'Consult a Doctor',
              description:
                  'Enter your location to discover nearby doctors, and schedule an appointment effortlessly.',
              onTap: () => _navigateToDetectedScreen(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 343,
      height: 149,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color.fromARGB(255, 195, 195, 201),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.lightPrimaryColor,
                  size: 25.0,
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF2BB598),
                    fontSize: 16,
                    fontFamily: 'Sunflower',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              description,
              style: TextStyle(
                color: AppColors.lightBlackColor,
                fontSize: 13,
                fontFamily: 'Kodchasan',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: onTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
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
