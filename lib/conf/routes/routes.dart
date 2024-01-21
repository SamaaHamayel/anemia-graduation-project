import 'package:animeacheck/features/auth/presentation/view/signIn_screen.dart';
import 'package:animeacheck/features/startted/onboarding/presentation/view/onboarding1.dart';
import 'package:animeacheck/features/startted/splach/presentation/view/splash_view.dart';
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
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.onBoarding1:
        return MaterialPageRoute(builder: (_) => const onBoarding());

      case Routes.onBoarding2:
        return MaterialPageRoute(builder: (_) => const onBoarding());

      case Routes.onBoarding3:
        return MaterialPageRoute(builder: (_) => const onBoarding());

      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      // case Routes.signUp:
      //   return MaterialPageRoute(builder: (_) => const SignUpScreen());
      //
      // case Routes.wrongPassword:
      //   return MaterialPageRoute(builder: (_) => const WrongPasswordScreen());
      //
      // case Routes.forgotPassword:
      //   return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      //
      // case Routes.verify:
      //   return MaterialPageRoute(builder: (_) => const VerfiyScreen());
      //
      // case Routes.newPassword:
      //   return MaterialPageRoute(builder: (_) => const NewPasswordScreen());
      //
      // case Routes.camera:
      //   return MaterialPageRoute(builder: (_) => const CameraScreen());
      //
      // case Routes.home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
      //
      // case Routes.Reshotting:
      //   return MaterialPageRoute(builder: (_) => const ReshottingScreen());
      //
      // case Routes.upLoad:
      //   return MaterialPageRoute(builder: (_) => const UploadScreen());
      // case Routes.eyelid:
      //   return MaterialPageRoute(builder: (_) => const EyelidScreen());
      //
      // case Routes.result:
      //   return MaterialPageRoute(builder: (_) => const ResultScreen());
      // case Routes.profile:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Found Route")),
          ),
        );
    }
  }
}
