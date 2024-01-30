import 'package:flutter/material.dart';

import '../../../../core/utils/appColors/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key, required this.text, required this.alignment, this.color,
  });


  final String text;
  final Alignment alignment;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: color ?? AppColors.primaryColor,
              fontSize: 13,
              fontFamily: "Kodchasan",
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
