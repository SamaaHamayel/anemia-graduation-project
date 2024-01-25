import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/appColors/app_colors.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text(state.errorModel.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: RegisterCubit.get(context).formKEy,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 85.h,
                  ),
                  Image.asset(
                    "assets/images/route.png",
                    width: 237.w,
                    height: 71.h,
                  ),
                  SizedBox(
                    height: 89.h,
                  ),
                  TextFormField(
                    controller: RegisterCubit.get(context).nameController,
                    decoration: InputDecoration(
                        hintText: "Username",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                  SizedBox(
                    height: 74.h,
                  ),
                  TextFormField(
                    controller: RegisterCubit.get(context).emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                  SizedBox(
                    height: 74.h,
                  ),
                  TextFormField(
                    controller: RegisterCubit.get(context).passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "password",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                  SizedBox(
                    height: 74.h,
                  ),
                  TextFormField(
                    controller: RegisterCubit.get(context).phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: "Phone",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(398.w, 64.h),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        RegisterCubit.get(context).register();
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 20.sp, color: AppColors.primaryColor),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
