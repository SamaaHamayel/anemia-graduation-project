import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/history/presentation/view/history.dart';
import 'package:animeacheck/features/home/my_account/presentation/view/edit_profile.dart';
import 'package:animeacheck/features/home/pri_home/presentation/view/pri_home.dart';

class MyAccount extends StatefulWidget {
  @override
  State<MyAccount> createState() => MyAccountState();
}

class MyAccountState extends State<MyAccount> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              buildProfileCard(),
              SizedBox(height: 28),
              buildActionCard(
                icon: Icons.person_2_outlined,
                title: 'Edit Profile',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => editProfile()),
                  );
                },
              ),
              SizedBox(height: 28),
              buildActionCard(
                icon: Icons.science_outlined,
                title: 'Test Results History',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => history()),
                  );
                },
              ),
              SizedBox(height: 28),
              buildActionCard(
                icon: Icons.storage,
                title: 'Information',
                onPressed: () {
                  // Navigate to information page
                },
              ),
              SizedBox(height: 28),
              buildNotificationCard(),
              SizedBox(height: 45),
              Text(
                'Log out',
                style: TextStyle(
                  color: Color(0xFFFF0404),
                  fontSize: 18,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.lightPrimaryColor,
            size: 23.sp,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PriHome()),
            );
          },
        ),
        SizedBox(width: 85.w),
        Text(
          'Profile',
          style: TextStyle(
            color: AppColors.lightPrimaryColor,
            fontSize: 23.sp,
            fontFamily: 'Kodchasan',
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: 1.76,
          ),
        ),
      ],
    );
  }

  Widget buildProfileCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Container(
        width: 345,
        height: 80,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFE6E4E4)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.lightPrimaryColor,
                child: Image.asset(
                  AppAssets.female,
                  width: double.infinity,
                ),
              ),
              Text(
                'Sarah Shebl',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.9),
                  fontSize: 16,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 100),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => editProfile()),
                  );
                },
                icon: Icon(
                  Icons.border_color_outlined,
                  color: AppColors.lightPrimaryColor,
                  size: 30.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionCard(
      {required IconData icon,
      required String title,
      required Function() onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 00.0),
      child: Container(
        width: 330,
        height: 56,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFE6E4E4)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: AppColors.lightPrimaryColor,
                size: 30.0,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.9),
                  fontSize: 12,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 100),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.lightPrimaryColor,
                  size: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 00.0),
      child: Container(
        width: 330,
        height: 56,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFE6E4E4)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications_outlined,
                color: AppColors.lightPrimaryColor,
                size: 30.0,
              ),
              Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 14,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 100),
              Switch(
                activeColor: AppColors.lightPrimaryColor,
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
