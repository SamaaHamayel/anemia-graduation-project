import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/images/app_assets.dart';
import 'package:animeacheck/core/utils/appString/app_strings.dart';
import 'package:animeacheck/features/startted/onboarding/data/models/on_boarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboardininffo.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final page = [
      OnBoardingPage(
        model: OnBoardingModel(
            title: AppStrings.onBoardingTitle0,
            subtitle: AppStrings.onBoardingSubTitle0,
            image: AppAssets.onBoarding0,
            counterText: AppStrings.onBoardingcounter0,
            bgColor: AppColors.primaryColor,
            height: size.height),
      ),
      OnBoardingPage(
        model: OnBoardingModel(
            title: AppStrings.onBoardingTitle1,
            subtitle: AppStrings.onBoardingSubTitle1,
            image: AppAssets.onBoarding1,
            counterText: AppStrings.onBoardingcounter1,
            bgColor: AppColors.primaryColor,
            height: size.height),
      ),
      OnBoardingPage(
        model: OnBoardingModel(
            title: AppStrings.onBoardingTitle2,
            subtitle: AppStrings.onBoardingSubTitle2,
            image: AppAssets.onBoarding2,
            counterText: AppStrings.onBoardingcounter2,
            bgColor: AppColors.primaryColor,
            height: size.height),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: page,
            liquidController: controller,
            onPageChangeCallback: onPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_forward_ios),
            enableSideReveal: true,
          ),
          Positioned(
              bottom: 60,
              child: OutlinedButton(
                  onPressed: () {
                    int nextPage = controller.currentPage + 1;
                    controller.animateToPage(page: nextPage);
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, side: const BorderSide(
                        color: AppColors.blackColor,
                      ),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20)),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: AppColors.blackColor, shape: BoxShape.circle),
                    child: const Icon(Icons.arrow_forward_ios),
                  ))),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: () => controller.jumpToPage(page: 2),
                child: const Text(
                  AppStrings.skip,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontFamily: 'Kodchasan',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              )),
          Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 3,
                effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.primaryColor, dotHeight: 5.0),
              ))
        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
