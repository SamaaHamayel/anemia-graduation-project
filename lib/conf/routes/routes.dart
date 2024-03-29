import 'package:flutter/material.dart';

import '../../features/auth/presentation/view/forget_password_screen.dart';
import '../../features/auth/presentation/view/sign_in_screen.dart';
import '../../features/auth/presentation/view/sign_up_screen.dart';
import '../../features/auth/presentation/view/verfiy_screen.dart';
import '../../features/home/presentation/view/home.dart';
import '../../features/startted/onboarding/presentation/view/onboarding1.dart';
import '../../features/startted/splach/presentation/view/splash_view.dart';

class Routes {
  static const String intialRoutes = "/";
  static const String onBoarding = "/onBoarding";

  static const String login = "/login";
  static const String signUp = "/signUp";
  static const String register = "/register";
  static const String signIn = "/signIn";
  static const String wrongPassword = "/wrongPassword";
  static const String forgotPassword = "/forgotPassword";
  static const String verify = "/verify";
  static const String newPassword = "/newPassword";
  static const String home = "/home";
  static const String camera = "/camera";
  static const String reShotting = "/re_shotting";
  static const String upLoad = "/upLoad";
  static const String eyelid = "/eyelid";
  static const String result = "/result";
  static const String profile = "/profile";
  static const String setting = "/setting";
  static const String history = "/history";
  static const String myAccount = "/myAccount";
  static const String priHome = "/priHome";
  static const String dettected = "/dettected";
  static const String DetectAnemiabyEye = "/DetectAnemiabyEye";
  static const String DetectAnemiabyimage = "/DetectAnemiabyimage";
}

class AppRoutes {
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intialRoutes:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );

      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      // case Routes.wrongPassword:
      //   return MaterialPageRoute(builder: (_) => const WrongPasswordScreen());
      //

      case Routes.verify:
        return MaterialPageRoute(builder: (_) => const VerfiyScreen());

      // case Routes.newPassword:
      //   return MaterialPageRoute(builder: (_) => const NewPasswordScreen());
      //
      // case Routes.camera:
      //   return MaterialPageRoute(builder: (_) => const CameraScreen());
      //
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

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
