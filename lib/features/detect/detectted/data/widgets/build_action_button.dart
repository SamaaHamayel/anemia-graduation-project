import 'package:flutter/material.dart';

import '../../../../../core/utils/appColors/app_colors.dart';

Widget buildActionButton({
  required IconData iconData,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: 335,
        padding: const EdgeInsets.symmetric(vertical: 12),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Container(
          width: 40,
          height: 40,
          clipBehavior: Clip.antiAlias,
          decoration:const BoxDecoration(),
          child: Icon(
            iconData,
            color: AppColors.lightPrimaryColor,
            size: 40.0,
          ),
        ),
      ),
    ),
  );
}
