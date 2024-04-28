import 'package:animeacheck/conf/routes/routes.dart';
import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/app_text_them.dart';
import 'package:animeacheck/core/utils/common.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../presentation/view/onboardininffo.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingPage extends StatelessWidget {
  final PageController controller;
  const OnBoardingPage({
    Key? key,
    required this.model,
    required this.currentIndex,
    required this.controller,
  }) : super(key: key);

  final OnBoardingModel model;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
  create: (context) => SettingsCubit(),
  child: Container(
      padding: const EdgeInsets.all(20),
      color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
          ?AppColors.blackColor:AppColors.lightPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextButton(
                  onPressed: () => navigateReplacement(context: context, route: Routes.signIn),
                  child: Text(
                    AppLocalizations.of(context)!.skip,
                    style: textStyle(
                        color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                            ?AppColors.whiteColor:AppColors.lightPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          Image.asset(
            model.image,
            width: size.width / 1.5,
          ),
          Column(
            children: [
              Text(
                currentIndex == 0
                    ? AppLocalizations.of(context)!.onBoardingTitle0
                    : currentIndex == 1 // And here
                    ? AppLocalizations.of(context)!.onBoardingTitle1
                    : AppLocalizations.of(context)!.onBoardingTitle2,
                style: TextStyle(
                  color: currentIndex == 1 // And here
                      ? AppColors.primaryColor
                      : AppColors.whiteColor,
                  fontSize: 20,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w700,
                  height: 1.5, // Set a sensible line height
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                currentIndex == 0 // And here
                    ? AppLocalizations.of(context)!.onBoardingSubTitle0
                    : currentIndex == 1 // And here
                    ? AppLocalizations.of(context)!.onBoardingSubTitle1
                    : AppLocalizations.of(context)!.onBoardingSubTitle2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: currentIndex == 1 // And here
                      ? AppColors.primaryColor
                      : AppColors.whiteColor,
                  fontSize: 16,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ],
          ),
          Text(
            currentIndex == 0 // And here
                ? AppLocalizations.of(context)!.onBoardingcounter0
                : currentIndex == 1 // And here
                ? AppLocalizations.of(context)!.onBoardingcounter1
                : AppLocalizations.of(context)!.onBoardingcounter2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: currentIndex == 1 // And here
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              fontSize: 16,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w600,
              height: 1.5, // Set a sensible line height
            ),
          ),
          OutlinedButton(
            onPressed: () {
              if (controller.page != 2) {
                controller.nextPage(
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeInOut,
                );
              }else if(controller.page==2){
                navigateReplacement(context: context, route: Routes.signIn);
              }
            },
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, side: BorderSide(
                  color: currentIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.whiteColor,
                ),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20)),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: currentIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.whiteColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: currentIndex == 1
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: currentIndex == 1 // And here
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              dotColor: Colors.grey,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 8,
            ),
          )
        ],
      ),
    ),
);
  }
}