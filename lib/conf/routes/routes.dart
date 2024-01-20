import 'package:animeacheck/features/startted/onboarding/presentation/view/onboarding1.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = "/";
  static const String onBoarding1 = "onBoarding1";
  static const String onBoarding2 = "onBoarding2";
  static const String onBoarding3 = "onBoarding3";
  static const String login = "login";
  static const String signUp = "signUp";
  static const String signIn = "signIn";
  static const String wrongPassword = "wrongPassword";
  static const String forgotPassword = "forgotPassword";
  static const String verify = "verify";
  static const String newPassword = "newPassword";
  static const String home = "home";
  static const String camera = "camera";
  static const String Reshotting = "Reshotting";
  static const String upLoad = "upLoad";
  static const String eyelid = "eyelid";
  static const String result = "result";
  static const String profile = "profile";
}

class AppRoutes {
  ongenrate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        MaterialPageRoute(
          builder: (context) => onBoarding(),
        );
        break;
    }
  }
}
