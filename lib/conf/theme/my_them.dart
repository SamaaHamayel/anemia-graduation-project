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

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.darkThemBlackColor,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.whiteColor,
        onPrimary: AppColors.lightPrimaryColor,
        secondary: AppColors.whiteColor,
        onSecondary: Color(0xff052F28),
        error: Colors.red,
        onError: Colors.white,
        background: Colors.transparent,
        onBackground: AppColors.lightPrimaryColor,
        surface: Colors.white,
        onSurface: AppColors.whiteColor),
    appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF242424)),
            
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black87),
        elevation: 0.0,
        centerTitle: true),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        backgroundColor: AppColors.darkThemBlackColor,
        selectedItemColor: AppColors.lightPrimaryColor,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: GoogleFonts.quicksand(fontSize: 12),
        unselectedLabelStyle: GoogleFonts.quicksand(fontSize: 12)),
  );
}