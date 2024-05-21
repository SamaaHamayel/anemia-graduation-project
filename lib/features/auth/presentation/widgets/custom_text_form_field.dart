import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/appColors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField( {
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.validate,
    this.isPassword = false,
    this.icon,
    this.suffixIconOnPressed,
    this.keyboardType,
    this.prefixIcon,
    this.errorText,
    this.textInputAction,

  });
  final TextEditingController controller;
  final String? hint;
  final String? errorText;
  final String? label;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validate;
  final bool isPassword;
  final IconData? icon;
  final VoidCallback? suffixIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextFormField(
        style: const TextStyle(color: AppColors.primaryColor),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        controller: controller,
        cursorColor: AppColors.primaryColor,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(8)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor)),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          errorText: errorText,
          errorStyle: const TextStyle(
              color: AppColors.redColor,
              fontSize: 13,
              fontWeight: FontWeight.w600),
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.hintTextColor),
          labelText: label,
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: AppColors.primaryColor,
          suffixIcon: IconButton(
            onPressed: suffixIconOnPressed,
            icon: Icon(
              icon,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
