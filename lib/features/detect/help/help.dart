import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpDetect extends StatelessWidget {
  const HelpDetect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:  Image(
                   image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable ?AssetImage('lib/core/utils/appImages/images/backgroundDark.png') :AssetImage('lib/core/utils/appImages/images/background.png'),

          fit: BoxFit.cover,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.arrow_back_ios,
            size: 23,
        color:  BlocProvider.of<SettingsCubit>(context).isDarkThemEnable? AppColors.whiteColor : AppColors.lightPrimaryColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.help,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 24.sp,
        color:  BlocProvider.of<SettingsCubit>(context).isDarkThemEnable? AppColors.whiteColor : AppColors.lightPrimaryColor,
                fontFamily: 'Kodchasan',
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
                    image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable ?AssetImage('lib/core/utils/appImages/images/backgroundDark.png') :AssetImage('lib/core/utils/appImages/images/background.png'),

            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildHelpText(context, AppLocalizations.of(context)!.helpOne),
              buildImage('lib/core/utils/appImages/images/eyeExample.png',
                  222.w, 158.h),
              buildSeparator(),
              buildHelpText(context, AppLocalizations.of(context)!.helpTwo),
              buildSeparator(),
              buildHelpText(context, AppLocalizations.of(context)!.helpThree),
              buildSeparator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHelpText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style:  TextStyle(
        color:  BlocProvider.of<SettingsCubit>(context).isDarkThemEnable? AppColors.whiteColor : AppColors.blackColor,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget buildImage(String assetPath, double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildSeparator() {
    return Container(
      width: 375.w,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColors.lightGrayColor,
          ),
        ),
      ),
    );
  }
}
