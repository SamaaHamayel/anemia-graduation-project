import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: Colors.black54,
        secondary: AppColors.lightPrimaryColor,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.transparent,
        onBackground: AppColors.lightPrimaryColor,
        surface: Colors.white,
        onSurface: Colors.black),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      iconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      // selectedLabelStyle: GoogleFonts.quicksand(fontSize: 12),
      //unselectedLabelStyle: GoogleFonts.quicksand(fontSize: 12),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey,
    ),
  );

  // static ThemeData darkTheme = ThemeData(
  //   primaryColor: darkPrimaryColor,
  //   scaffoldBackgroundColor: Colors.transparent,
  //   colorScheme: ColorScheme(
  //       brightness: Brightness.dark,
  //       primary: darkPrimaryColor,
  //       onPrimary: yellowColor,
  //       secondary: darkPrimaryColor,
  //       onSecondary: Colors.white,
  //       error: Colors.red,
  //       onError: Colors.white,
  //       background: Colors.transparent,
  //       onBackground: yellowColor,
  //       surface: Colors.white,
  //       onSurface: darkPrimaryColor),
  //   appBarTheme: AppBarTheme(
  //       titleTextStyle: GoogleFonts.elMessiri(
  //           fontSize: 30,
  //           fontWeight: FontWeight.bold,
  //           color: Color(0xFF242424)),
  //       backgroundColor: Colors.transparent,
  //       iconTheme: IconThemeData(color: darkPrimaryColor),
  //       elevation: 0.0,
  //       centerTitle: true),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //       type: BottomNavigationBarType.shifting,
  //       //showSelectedLabels: false,
  //       //showUnselectedLabels: false,
  //       backgroundColor: darkPrimaryColor,
  //       selectedItemColor: yellowColor,
  //       unselectedItemColor: Colors.white,
  //       selectedLabelStyle: GoogleFonts.quicksand(fontSize: 12),
  //       unselectedLabelStyle: GoogleFonts.quicksand(fontSize: 12)),
  // );
}