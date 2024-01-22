import 'package:animeacheck/core/utils/appImages/images/app_assets.dart';
import 'package:animeacheck/core/utils/appString/app_strings.dart';
import 'package:animeacheck/features/startted/onboarding/data/models/on_boarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboardininffo.dart';

class onBoarding extends StatefulWidget {
  onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    
    final page = [
      OnBoardingPage(
        model: OnboardingModel(
            title: AppStrings.onBoardingTitle0,
            subtitle: AppStrings.onBoardingSubTitle0,
            image: AppAssets.onBoarding0,
            counterText: AppStrings.onBoardingcounter0,
            bgColor: Color(0xFF81B7AC),
            height: size.height),
      ),
      OnBoardingPage(
        model: OnboardingModel(
            title: AppStrings.onBoardingTitle1,
            subtitle: AppStrings.onBoardingSubTitle1,
            image: AppAssets.onBoarding1,
            counterText: AppStrings.onBoardingcounter1,
            bgColor: Color(0xFF81B7AC),
            height: size.height),
      ),
      OnBoardingPage(
        model: OnboardingModel(
            title: AppStrings.onBoardingTitle2,
            subtitle: AppStrings.onBoardingSubTitle2,
            image: AppAssets.onBoarding2,
            counterText: AppStrings.onBoardingcounter2,
            bgColor: Color(0xFF81B7AC),
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
          onPageChangeCallback: OnPageChangeCallback,
          slideIconWidget: Icon(Icons.arrow_back_ios),
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
                    side: BorderSide(
                      color: Colors.black26,
                    ),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    onPrimary: Colors.white),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.black12, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_forward_ios),
                ))),
        Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => controller.jumpToPage(page: 2),
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xFF2BB598),
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
              effect: ExpandingDotsEffect(
                  activeDotColor: Color(0xFF81B7AC), dotHeight: 5.0),
            ))
      ],
    ));
  }

  void OnPageChangeCallback(int activePageIndex) {
    setState(() {
          currentPage = activePageIndex;

    });
  }
}
