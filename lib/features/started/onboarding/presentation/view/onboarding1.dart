import 'package:animeacheck/features/started/onboarding/presentation/view/onboardininffo.dart';
import 'package:flutter/material.dart';

import '../../data/models/on_boarding_page_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: OnBoardingModel.list.length,
        itemBuilder: (context, index) {
          return OnBoardingPage(
            model: OnBoardingModel.list[index],
            currentIndex: index,
            controller: pageController,
          );
        },
      ),
    );
  }
}
