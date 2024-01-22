import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/appString/app_strings.dart';
import '../../presentation/view/onboardininffo.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color:  AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            model.image,
            height: model.height * 0.5,
          ),
          const Column(
            children: [
              Text(
                AppStrings.onBoardingTitle0,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Text(
                AppStrings.onBoardingSubTitle0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.lightBlackColor,
                  fontSize: 16,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
            ],
          ),
          const Text(
            AppStrings.onBoardingcounter0,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.lightBlackColor,
              fontSize: 16,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w400,
              height: 0.10,
            ),
          ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}
     