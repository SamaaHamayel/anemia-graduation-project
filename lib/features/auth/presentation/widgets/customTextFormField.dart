import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.validate,
    this.isPassword = false,
    this.icon,
    this.suffixIconOnPressed,
    this.keyboardType,
  });
  final TextEditingController controller;
  final String? hint;
  final String? label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validate;
  final bool isPassword;
  final IconData? icon;
  final VoidCallback? suffixIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      //cursorColor: AppColors.primary,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        hintText: hint,
        labelText: label,
        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon: Icon(
            icon,
           // color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}