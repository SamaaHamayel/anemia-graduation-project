import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/help_info/presentation/view/help_info.dart';
import 'package:animeacheck/features/home/presentation/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatelessWidget {
  final String message;

  const ResultScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAnemic = message == "anemia detected ";

    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        backgroundColor:
            BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AppColors.darkThemBlackColor
                : AppColors.lightPrimaryColor,
        appBar: AppBar(
          flexibleSpace: Image(
            image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 23.sp,
              color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AppColors.whiteColor
                  : AppColors.lightPrimaryColor,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AssetImage(
                      'lib/core/utils/appImages/images/backgroundDark.png')
                  : AssetImage(
                      'lib/core/utils/appImages/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'you have:',
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: BlocProvider.of<SettingsCubit>(context)
                              .isDarkThemEnable
                          ? AppColors.whiteColor
                          : AppColors.darkThemBlackColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      isAnemic ? 'anemic' : 'not anemic',
                      style: TextStyle(
                        fontSize: 38.sp,
                        fontWeight: FontWeight.bold,
                        color: isAnemic ? Colors.red : Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(height: 90.h),
                  Image.asset(isAnemic
                      ? AppAssets.notAnemiaDetect
                      : AppAssets.notAnemic),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.50,
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.lightPrimaryColor),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28.0, vertical: 8),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    BlocProvider.of<SettingsCubit>(context)
                                            .isDarkThemEnable
                                        ? AppColors.whiteColor
                                        : AppColors.lightPrimaryColor,
                                padding: EdgeInsets.zero,
                                textStyle: TextStyle(
                                  fontSize: 18.sp,
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.lightPrimaryColor,
                                  fontFamily: 'Kodchasan',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              child: const Text(
                                'Go back home',
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isAnemic)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: AppColors.lightPrimaryColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.50, color: Color(0xFF2BB598)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 28.0, vertical: 8),
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
                                  backgroundColor: AppColors.lightPrimaryColor,
                                  foregroundColor: AppColors.whiteColor,
                                  padding: EdgeInsets.zero,
                                  textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    color: AppColors.whiteColor,
                                    fontFamily: 'Kodchasan',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                child: const Text(
                                  'Self-awareness',
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
