
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/appString/app_strings.dart';
import '../../presentation/view/onboardininffo.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color:  Color(0xFF81B7AC),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            model.image,
            height: model.height * 0.5,
          ),
          Column(
            children: [
              Text(
                AppStrings.onBoardingTitle0,
                style: TextStyle(
                  color: Colors.black,
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
                  color: Color(0xFF535354),
                  fontSize: 16,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
            ],
          ),
          Text(
            AppStrings.onBoardingcounter0,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF535354),
              fontSize: 16,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w400,
              height: 0.10,
            ),
          ),
          SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}
     