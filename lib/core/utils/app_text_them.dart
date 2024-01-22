//one object of googleFonts

//(_)private as used here only
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appColors/app_colors.dart';

TextStyle textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.kodchasan(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}

//bold style
TextStyle boldStyle({
  Color color = AppColors.blackColor,
  double fontSize = 24,
}) =>
    textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

//regular style
TextStyle regularStyle({
  Color color = AppColors.blackColor,
  double fontSize = 24,
}) =>
    textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
