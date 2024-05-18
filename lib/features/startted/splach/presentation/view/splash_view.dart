import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:animeacheck/features/startted/splach/presentation/view/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child:  Scaffold(
        backgroundColor: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
            ?AppColors.darkThemBlackColor:AppColors.whiteColor,
        body: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
              image:
 BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : AssetImage('lib/core/utils/appImages/images/background.png'),                fit:
                  BoxFit.cover, // Optional: You can set the image fit as needed
            ),
          ),
          child: const SplashViewBody()),
      ),
    );
  }
}
