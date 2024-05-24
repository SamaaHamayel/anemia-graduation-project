import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/help_info/presentation/view/help_info.dart';
import 'package:animeacheck/features/home/pri_home/presentation/view/pri_home.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
//resultTest

class ResultTest extends StatefulWidget {
  final String result;
  const ResultTest({Key? key, required this.result}) : super(key: key);

  @override
  State<ResultTest> createState() => ResultState();
}

class ResultState extends State<ResultTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
              ? AssetImage('lib/core/utils/appImages/images/backgroundDark.png')
              : AssetImage('lib/core/utils/appImages/images/background.png'),
          // AssetImage('lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
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
              AppLocalizations.of(context)!.result,
              style: TextStyle(
                color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
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
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? const AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : const AssetImage(
                    'lib/core/utils/appImages/images/background.png',
                  ),
            fit: BoxFit.cover,
            // Optional: You can set the image fit as needed
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 277,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!
                              .theTypeOfAnemiaYouHaveIs,
                          style: TextStyle(
                            color: BlocProvider.of<SettingsCubit>(context)
                                    .isDarkThemEnable
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                            fontSize: 24,
                            fontFamily: 'Kodchasan',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: widget.result,
                          style: const TextStyle(
                            color: Color(0xFFFF0100),
                            fontSize: 24,
                            fontFamily: 'Kodchasan',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 325,
                  child: Text(
                    AppLocalizations.of(context)!.thisResult,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: BlocProvider.of<SettingsCubit>(context)
                              .isDarkThemEnable
                          ? AppColors.whiteColor
                          : AppColors.lightPrimaryColor,
                      fontSize: 18.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: 270.w,
                  height: 230.h,
                  child: Image.asset(AppAssets.symptoms)),
              Container(
                width: 172,
                height: 48,
                padding: const EdgeInsets.only(
                  top: 13,
                  left: 22,
                  right: 22,
                  bottom: 12,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.50,
                      color: BlocProvider.of<SettingsCubit>(context)
                              .isDarkThemEnable
                          ? AppColors.whiteColor
                          : AppColors.lightPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PriHome()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor:
                        BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                            ? AppColors.whiteColor
                            : AppColors.lightPrimaryColor,
                    padding: EdgeInsets.zero,
                    textStyle: const TextStyle(
                      fontFamily: 'Kodchasan',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)!.goBackHome),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: 172,
                height: 48,
                padding: const EdgeInsets.only(
                  top: 13,
                  left: 28,
                  right: 27,
                  bottom: 12,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFF2BB598), Color(0xFF398272)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HelpfulInformationScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.whiteColor,
                    padding: EdgeInsets.zero,
                    textStyle: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.whiteColor,
                      fontFamily: 'Kodchasan',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.helpYourself,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
