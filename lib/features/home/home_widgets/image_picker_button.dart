import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/appColors/app_colors.dart';
import '../setting/presentation/settings_cubit/settings_cubit.dart';

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 65.h,
          width: 335.w,
          decoration: BoxDecoration(
              color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AppColors.whiteColor
                  : AppColors.lightPrimaryColor,
              borderRadius: BorderRadius.circular(20.r)),
          child: Icon(
            icon,
            color: AppColors.whiteColor,
            size: 40,
          ),
        ),
      ),
    );
  }
}
