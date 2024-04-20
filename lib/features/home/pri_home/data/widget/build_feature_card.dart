 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/appColors/app_colors.dart';

Widget buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 343.w,
      height: 149.h,
      margin: EdgeInsets.symmetric(vertical: 10.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,
          color: const Color.fromARGB(255, 195, 195, 201),
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
                SizedBox(width: 10.w),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.lightPrimaryColor,
                    fontSize: 16,
                    fontFamily: 'Sunflower',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0.h),
            child: Text(
              maxLines: 2,
              description,
              style: const TextStyle(
                color: AppColors.lightBlackColor,
                fontSize: 14,
                fontFamily: 'Kodchasan',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    color: AppColors.lightPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 