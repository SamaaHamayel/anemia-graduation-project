import 'package:flutter/material.dart';

import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/appString/app_strings.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key, required this.text,
  });


  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.primaryColor,
              fontSize: 13,
              fontFamily: "Kodchasan",
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
