import 'package:animeacheck/features/startted/splach/presentation/view/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2BA3B4),
      body: SplashViewBody(),
    );
  }
}
