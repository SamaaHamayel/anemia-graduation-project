import 'package:flutter/widgets.dart';

import '../../../../../core/utils/appColors/app_colors.dart';
import '../../../../../core/utils/appImages/app_assets.dart';
import '../../../../../core/utils/appString/app_strings.dart';

class OnBoardingModel {
  final String title;
  final String subtitle;
  final String image;
  final String counterText;
  final Color bgColor;
  final Color skipColor;
  final int currentIndex;
  OnBoardingModel({
    required this.currentIndex,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.counterText,
    required this.bgColor,
    required this.skipColor,
  });

  static final List list = [
    OnBoardingModel(
      title: AppStrings.onBoardingTitle0,
      image: AppAssets.onBoarding0,
      subtitle: AppStrings.onBoardingSubTitle0,
      counterText: AppStrings.onBoardingcounter0,
      bgColor: AppColors.primaryColor,
      skipColor: AppColors.whiteColor,
      currentIndex: 0,
    ),
    OnBoardingModel(
      title: AppStrings.onBoardingTitle1,
      image: AppAssets.onBoarding1,
      subtitle: AppStrings.onBoardingSubTitle1,
      counterText: AppStrings.onBoardingcounter1,
      bgColor: AppColors.whiteColor,
      skipColor: AppColors.primaryColor,
      currentIndex: 1,
    ),
    OnBoardingModel(
      title: AppStrings.onBoardingTitle2,
      image: AppAssets.onBoarding2,
      subtitle: AppStrings.onBoardingSubTitle2,
      counterText: AppStrings.onBoardingcounter2,
      bgColor: AppColors.primaryColor,
      skipColor: AppColors.lightPrimaryColor,
      currentIndex: 2,
    ),
  ];
}