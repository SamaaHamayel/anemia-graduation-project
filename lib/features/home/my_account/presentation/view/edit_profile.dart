import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColors.lightPrimaryColor,
                      size: 23.sp,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 85.w),
                  Text(
                    'Result',
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
              ),
            ])
          ]),
        ));
  }
}