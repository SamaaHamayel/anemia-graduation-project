import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AssetImage(
                      'lib/core/utils/appImages/images/backgroundDark.png')
                  : AssetImage(
                      'lib/core/utils/appImages/images/background.png'),
              fit:
                  BoxFit.cover, // Optional: You can set the image fit as needed
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: BlocProvider.of<SettingsCubit>(context)
                                        .isDarkThemEnable
                                    ? AppColors.whiteColor
                                    : AppColors.lightPrimaryColor,
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
                                color: BlocProvider.of<SettingsCubit>(context)
                                        .isDarkThemEnable
                                    ? AppColors.whiteColor
                                    : AppColors.lightPrimaryColor,
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
          ),
        ));
  }
}
