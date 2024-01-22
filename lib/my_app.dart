import 'package:animeacheck/features/auth/presentation/view/signIn_screen.dart';
import 'package:animeacheck/features/startted/splach/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashView(),
    );
  }
}