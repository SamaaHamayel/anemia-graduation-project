import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/appString/app_strings.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 343.w,
        height: 56.h,
        child: ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            shadowColor: Color(0xFF398272),
            backgroundColor: Color(0xFF2BB598),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(AppStrings.signIn,style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.whiteColor,
              fontSize: 20,
              fontFamily: "Kodchasan",
              fontWeight: FontWeight.w700
          ),),
        ),
      ),
    );
  }
}
