import 'package:animeacheck/features/auth/presentation/view/createNewPassword_screen.dart';
import 'package:animeacheck/features/started/onboarding/presentation/view/onboarding1.dart';
import 'package:animeacheck/features/started/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/view/forget_password_screen.dart';
import '../../features/auth/presentation/view/info_one_screen.dart';
import '../../features/auth/presentation/view/info_two_screen.dart';
import '../../features/auth/presentation/view/sign_in_screen.dart';
import '../../features/auth/presentation/view/sign_up_screen.dart';
import '../../features/auth/presentation/view/verify_screen.dart';
import '../../features/home/my_account/presentation/view/my_account.dart';
import '../../features/home/presentation/view/home.dart';

class Routes {
  static const String initialRoutes = "/";
  static const String onBoarding = "/onBoarding";

  static const String signUp = "/signUp";
  static const String register = "/register";
  static const String signIn = "/signIn";
  static const String infoOne = "/infoOne";
  static const String infoTwo = "/infoTwo";
  static const String wrongPassword = "/wrongPassword";
  static const String forgotPassword = "/forgotPassword";
  static const String verify = "/verify";
  static const String newPassword = "/newPassword";
  static const String home = "/home";
  static const String medicineComponent = "/medicineComponent";
  static const String camera = "/camera";
  static const String reshotting = "/Reshotting";
  static const String upLoad = "/upLoad";
  static const String eyelid = "/eyelid";
  static const String result = "/result";
  static const String profile = "/profile";
  static const String explainScreen = "/explainScreen";
  //CBCTest    result
  static const String cBCTest = "/CBCTest";
  static const String myAccount = "/MyAccount";

}

class AppRoutes {
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoutes:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );

      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      // case Routes.medicineComponent:
      // return MaterialPageRoute(builder: (_) =>  MedicineComponent());

      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case Routes.infoOne:
        return MaterialPageRoute(builder: (_) => const InfoOneScreen());

      case Routes.infoTwo:
        return MaterialPageRoute(builder: (_) => const InfoTwoScreen());
      case Routes.myAccount:
        return MaterialPageRoute(builder: (_) => const MyAccount());

      // case Routes.wrongPassword:
      //   return MaterialPageRoute(builder: (_) => const WrongPasswordScreen());
      //

      case Routes.verify:
        return MaterialPageRoute(builder: (_) => const VerfiyScreen());

      case Routes.newPassword:
        return MaterialPageRoute(
            builder: (_) => const CreateNewPasswordScreen());

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
