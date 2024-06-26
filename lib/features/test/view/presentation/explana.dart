import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:animeacheck/features/test/view/presentation/cbc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/appColors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExplanaScreen extends StatelessWidget {
  const ExplanaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? (AppAssets.backgroundDark)
                : (AppAssets.background),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 20, right: 20, left: 40),
            child: SingleChildScrollView(
              child: Expanded(
                child: Column(
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
                            size: 25.0.sp,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: 85.w),
                        Text(
                          'CBC Test',
                          style: TextStyle(
                            color: BlocProvider.of<SettingsCubit>(context)
                                    .isDarkThemEnable
                                ? AppColors.whiteColor
                                : AppColors.lightPrimaryColor,
                            fontSize: 22,
                            fontFamily: 'Kodchasan',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 1.76,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    SizedBox(
                      width: 343.w,
                      child: Text(
                        'This is the form that the lab results will come on:',
                        style: TextStyle(
                          color: BlocProvider.of<SettingsCubit>(context)
                                  .isDarkThemEnable
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                          fontSize: 18,
                          fontFamily: 'Kumbh Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Image.asset(
                            'lib/core/utils/appImages/images/test.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 347.h,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'If the',
                              style: TextStyle(
                                color: BlocProvider.of<SettingsCubit>(context)
                                        .isDarkThemEnable
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                                fontSize: 16,
                                fontFamily: 'Kumbh Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xFF2BB598),
                                fontSize: 16,
                                fontFamily: 'Kumbh Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const TextSpan(
                              text: 'result',
                              style: TextStyle(
                                color: Color(0xFF2BB598),
                                fontSize: 16,
                                fontFamily: 'Kumbh Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' is “lower than” the minimum number in the range(',
                              style: TextStyle(
                                color: BlocProvider.of<SettingsCubit>(context)
                                        .isDarkThemEnable
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                                fontSize: 16,
                                fontFamily: 'Kumbh Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: '13.5',
                              style: TextStyle(
                                color: BlocProvider.of<SettingsCubit>(context)
                                        .isDarkThemEnable
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                                fontSize: 14,
                                fontFamily: 'Kumbh Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: '), choose "',
                              style: TextStyle(
                                color: BlocProvider.of<SettingsCubit>(context)
                                        .isDarkThemEnable
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                                fontSize: 16,
                                fontFamily: 'Kumbh Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const TextSpan(
                              text: 'less',
                              style: TextStyle(
                                color: Color(0xFF2BB598),
                                fontSize: 16,
                                fontFamily: 'Kumbh Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: '" by clicking on the arrow below.',
                              style: TextStyle(
                                color: BlocProvider.of<SettingsCubit>(context)
                                        .isDarkThemEnable
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                                fontSize: 16,
                                fontFamily: 'Kumbh Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 343.w,
                      height: 88.h,
                      padding: EdgeInsets.symmetric(
                        vertical: 20.w,
                        // horizontal: 65,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'HB:',
                                  style: TextStyle(
                                    color:
                                        BlocProvider.of<SettingsCubit>(context)
                                                .isDarkThemEnable
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor,
                                    fontSize: 20,
                                    fontFamily: 'Kodchasan',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(width: 79),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 12,
                                              left: 9,
                                              right: 8,
                                              bottom: 12),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                color: BlocProvider.of<
                                                                SettingsCubit>(
                                                            context)
                                                        .isDarkThemEnable
                                                    ? AppColors.whiteColor
                                                    : AppColors.blackColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            shadows: [
                                              BoxShadow(
                                                color: BlocProvider.of<
                                                                SettingsCubit>(
                                                            context)
                                                        .isDarkThemEnable
                                                    ? AppColors
                                                        .lightPrimaryColor
                                                    : AppColors.whiteColor,
                                                blurRadius: 4,
                                                offset: const Offset(0, 0),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Less',
                                                    style: TextStyle(
                                                      color: BlocProvider.of<
                                                                      SettingsCubit>(
                                                                  context)
                                                              .isDarkThemEnable
                                                          ? AppColors.whiteColor
                                                          : AppColors
                                                              .blackColor,
                                                      fontSize: 14,
                                                      fontFamily: 'Kodchasan',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(width: 44.w),
                                                  const ExpandLessIcon(),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 375.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.w,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: BlocProvider.of<SettingsCubit>(context)
                                      .isDarkThemEnable
                                  ? AppColors.whiteColor
                                  : AppColors.lightPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                        width: 347.w,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'If the',
                                style: TextStyle(
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Color(0xFF2BB598),
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const TextSpan(
                                text: 'result',
                                style: TextStyle(
                                  color: Color(0xFF2BB598),
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' is “higher than” the maximum number in the range(',
                                style: TextStyle(
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '17.5',
                                style: TextStyle(
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 14,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '), choose "',
                                style: TextStyle(
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const TextSpan(
                                text: 'greater',
                                style: TextStyle(
                                  color: Color(0xFF2BB598),
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '" by clicking on the arrow above.',
                                style: TextStyle(
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                      width: 343.w,
                      height: 88.h,
                      padding: EdgeInsets.symmetric(
                        vertical: 20.w,
                        // horizontal: 65,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'HB:',
                                  style: TextStyle(
                                    color:
                                        BlocProvider.of<SettingsCubit>(context)
                                                .isDarkThemEnable
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor,
                                    fontSize: 20,
                                    fontFamily: 'Kodchasan',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(width: 79.w),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 12,
                                              left: 9,
                                              right: 8,
                                              bottom: 12),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                color: BlocProvider.of<
                                                                SettingsCubit>(
                                                            context)
                                                        .isDarkThemEnable
                                                    ? AppColors.whiteColor
                                                    : AppColors.blackColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            shadows: [
                                              BoxShadow(
                                                color: BlocProvider.of<
                                                                SettingsCubit>(
                                                            context)
                                                        .isDarkThemEnable
                                                    ? AppColors
                                                        .lightPrimaryColor
                                                    : AppColors.whiteColor,
                                                blurRadius: 4,
                                                offset: const Offset(0, 0),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: double.infinity,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'greater',
                                                      style: TextStyle(
                                                        color: BlocProvider.of<
                                                                        SettingsCubit>(
                                                                    context)
                                                                .isDarkThemEnable
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .blackColor,
                                                        fontSize: 14,
                                                        fontFamily: 'Kodchasan',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(width: 44.w),
                                                    const ExpandLessIcon(),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 375.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: BlocProvider.of<SettingsCubit>(context)
                                      .isDarkThemEnable
                                  ? AppColors.whiteColor
                                  : AppColors.lightPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                        width: 347,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'If the ',
                                style: TextStyle(
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const TextSpan(
                                text: 'result',
                                style: TextStyle(
                                  color: Color(0xFF2BB598),
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' is “between” the minimum and maximum values of the range, it will be "',
                                style: TextStyle(
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const TextSpan(
                                text: 'normal',
                                style: TextStyle(
                                  color: Color(0xFF2BB598),
                                  fontSize: 12,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '"',
                                style: TextStyle(
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontFamily: 'Kumbh Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 343.w,
                        height: 88.h,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          // horizontal: 65,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'HB:',
                                    style: TextStyle(
                                      color: BlocProvider.of<SettingsCubit>(
                                                  context)
                                              .isDarkThemEnable
                                          ? AppColors.whiteColor
                                          : AppColors.blackColor,
                                      fontSize: 20,
                                      fontFamily: 'Kodchasan',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(width: 79),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 12,
                                                left: 9,
                                                right: 8,
                                                bottom: 12),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  width: 1,
                                                  color: BlocProvider.of<
                                                                  SettingsCubit>(
                                                              context)
                                                          .isDarkThemEnable
                                                      ? AppColors.whiteColor
                                                      : AppColors.blackColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: BlocProvider.of<
                                                                  SettingsCubit>(
                                                              context)
                                                          .isDarkThemEnable
                                                      ? AppColors
                                                          .lightPrimaryColor
                                                      : AppColors.whiteColor,
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 0),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: double.infinity,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Normal',
                                                        style: TextStyle(
                                                          color: BlocProvider.of<
                                                                          SettingsCubit>(
                                                                      context)
                                                                  .isDarkThemEnable
                                                              ? AppColors
                                                                  .whiteColor
                                                              : AppColors
                                                                  .blackColor,
                                                          fontSize: 14.sp,
                                                          fontFamily:
                                                              'Kodchasan',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(width: 30.w),
                                                      const ExpandLessIcon(),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 375.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.w,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: BlocProvider.of<SettingsCubit>(context)
                                      .isDarkThemEnable
                                  ? AppColors.whiteColor
                                  : AppColors.lightPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      width: 172.w,
                      height: 48.h,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [Color(0xFF2BB598), Color(0xFF398272)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CBCTest()),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          textStyle: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.whiteColor,
                            fontFamily: 'Kodchasan',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.start,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandLessIcon extends StatelessWidget {
  const ExpandLessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
          ? AppColors.lightPrimaryColor
          : AppColors.whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8.w,
            height: 8.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Icon(
              Icons.expand_more,
              size: 8.sp,
              color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            ),
          ),
          // SizedBox(height: 8),
          Container(
            width: 6.w,
            height: 10.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Icon(
              Icons.expand_less,
              size: 8.sp,
              color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
