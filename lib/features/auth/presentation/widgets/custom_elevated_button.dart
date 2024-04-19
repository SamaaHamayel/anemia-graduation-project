
import 'package:flutter/material.dart';
import '../../../../core/utils/appColors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 343,
          height: 56,
          padding: const EdgeInsets.symmetric(vertical: 15),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF2BB598), Color(0xFF398272)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.whiteColor,
                fontSize: 20,
                fontFamily: "Kodchasan",
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
