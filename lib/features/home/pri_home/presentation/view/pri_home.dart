import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_cubit.dart';
import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_state.dart';
import 'package:animeacheck/features/detect/help/error/error.dart';
import 'package:animeacheck/features/home/help_info/presentation/view/help_info.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:animeacheck/features/test/view/presentation/explana.dart';
import 'package:flutter/material.dart';
import 'package:animeacheck/features/detect/detectted/view/detectted.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/appColors/app_colors.dart';
import '../../data/widget/build_feature_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class PriHome extends StatelessWidget {
  const PriHome({
    super.key,
  });
  Future<bool> _isConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult != ConnectivityResult.none;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? const AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : const AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover, // Optional: You can set the image fit as needed
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.welcome +
                        BlocProvider.of<SignUpCubit>(context)
                            .nameController
                            .text,
                    style: TextStyle(
                      color: BlocProvider.of<SettingsCubit>(context)
                              .isDarkThemEnable
                          ? AppColors.whiteColor
                          : AppColors.lightPrimaryColor,
                      fontSize: 18,
                      fontFamily: 'Kodchasan',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 351.w,
                    child: Text(
                      AppLocalizations.of(context)!.homeScreenSubTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Kodchasan',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  buildFeatureCard(
                    icon: Icons.camera_alt_rounded,
                    title: AppLocalizations.of(context)!.detectAnemia,
                    description:
                        AppLocalizations.of(context)!.homeScreenTitle,
                    onTap: () => _navigateToDetectedScreen(context),
                  ),
                  buildFeatureCard(
                      icon: Icons.biotech,
                      title: AppLocalizations.of(context)!.testResults,
                      description:
                          AppLocalizations.of(context)!.testResultsTitle,
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ExplanaScreen()),
                          )),
                  buildFeatureCard(
                      icon: Icons.quiz,
                      title: AppLocalizations.of(context)!.helpfulInformation,
                      description:
                          AppLocalizations.of(context)!.helpfulInformationTitle,
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HelpfulInformationScreen()),
                          )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
// Future<bool> _isConnected() async {
  // var connectivityResult = await (Connectivity().checkConnectivity());
  // return connectivityResult != ConnectivityResult.none;
void _navigateToDetectedScreen(BuildContext context) async {
  bool isConnected = await _isConnected();

  if (isConnected) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DetectedScreen()),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ErrorScreen(
          onRetry: () => _navigateToDetectedScreen(context),
        ),
      ),
    );
  }
}

}
