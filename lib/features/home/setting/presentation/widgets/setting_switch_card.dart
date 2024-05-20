import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/appColors/app_colors.dart';

class SettingSwitchCard extends StatelessWidget {
  const SettingSwitchCard({
    super.key,
    required this.text,
    required this.icon,
    required this.switchValue,
    required this.onChange,
  });

  final String text;
  final IconData icon;
  final bool switchValue;
  final void Function(bool)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        border: Border.all(color: AppColors.grayColor),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundColor: AppColors.settingIconColor,
              child: Icon(
                icon,
                color: AppColors.blackColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
          const Spacer(),
          Switch(
              value: switchValue,
              activeColor:
                  BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                      ? AppColors.whiteColor
                      : AppColors.lightPrimaryColor,
              onChanged: onChange!)
        ],
      ),
    );
  }
}
