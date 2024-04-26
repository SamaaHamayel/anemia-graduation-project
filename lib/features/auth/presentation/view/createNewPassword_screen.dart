import 'package:animeacheck/features/auth/presentation/forgetPassword_cubit/forget_password_cubit.dart';
import 'package:animeacheck/features/auth/presentation/forgetPassword_cubit/forget_password_state.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../conf/routes/routes.dart';
import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/appImages/app_assets.dart';
import '../../../../core/utils/appString/app_strings.dart';
import '../../../../core/utils/common.dart';
import '../widgets/custom_image.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            navigateReplacement(context: context, route: Routes.verify);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: AppColors.primaryColor,
          ),
        ),
        title: Text(
          AppStrings.createNewPassword,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if(state is ResetPasswordSuccessState){
              //Show message
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const CircleAvatar(
                    backgroundColor: AppColors.lightPrimaryColor,
                    child: Icon(Icons.check_sharp,
                    color: AppColors.whiteColor,),),
                  content:  Text(
                    AppStrings.yourPasswordHasBeenChangedSuccessfully,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColors.blackColor,
                      fontSize: 16,
                      fontFamily: "Kodchasan",),
                  ),
                  actions: [
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomElevatedButton(
                        text: AppStrings.signIn,
                        onPressed: (){
                          navigateReplacement(context: context, route: Routes.home);
                        },),
                  ],
                ),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<ForgetPasswordCubit>(context).resetPasswordKey,
              child: Column(
                children: [
                  const CustomImage(imagePath: AppAssets.createNewPassword),
                  SizedBox(
                    height: 48.h,
                  ),

                  //___newPassword_____
                  const CustomText(
                      alignment: Alignment.bottomLeft,
                      text: AppStrings.newPassword),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<ForgetPasswordCubit>(context)
                        .newPasswordController,
                    prefixIcon: Icons.lock_outlined,
                    hint: AppStrings.newPassword,
                    textInputAction: TextInputAction.next,
                    isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                        .isNewPasswordShowing,
                    icon: BlocProvider.of<ForgetPasswordCubit>(context).newPasswordSuffixIcon,
                    suffixIconOnPressed: () {
                      BlocProvider.of<ForgetPasswordCubit>(context)
                          .changeNewPasswordSuffixIcon();
                    },
                    validate: (data) {
                      if (data!.length < 6 || data.isEmpty) {
                        return AppStrings.enterValidPassword;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),


                  //____confirm NewPassword____
                  const CustomText(
                      alignment: Alignment.bottomLeft,
                      text: AppStrings.confirmNewPassword),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<ForgetPasswordCubit>(context)
                        .confirmPasswordController,
                    prefixIcon: Icons.lock_outlined,
                    hint: AppStrings.confirmNewPassword,
                    textInputAction: TextInputAction.next,
                    isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                        .isConfirmPasswordShowing,
                    icon: BlocProvider.of<ForgetPasswordCubit>(context).confirmPasswordSuffixIcon,
                    suffixIconOnPressed: () {
                      BlocProvider.of<ForgetPasswordCubit>(context)
                          .changeConfirmPasswordSuffixIcon();
                    },
                    validate: (data) {
                      if (data!.length < 6 || data.isEmpty) {
                        return AppStrings.enterValidPassword;
                      }
                      if (data!=BlocProvider.of<ForgetPasswordCubit>(context).newPasswordController.text){
                        return AppStrings.enterValidPasswordEqualTo;
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),


                  //____code_____
                  const CustomText(
                      alignment: Alignment.bottomLeft,
                      text: AppStrings.code),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextFormField(
                    prefixIcon: Icons.code,
                    keyboardType: TextInputType.number,
                    controller:
                    BlocProvider.of<ForgetPasswordCubit>(context)
                        .codeController,
                    hint: AppStrings.code,
                    validate: (data) {
                      //123h ==> null
                      //123 ==> true & return 123
                      if(num.tryParse(data!)== null){
                        return AppStrings.enterValidCode;
                      }
                      if (data.isEmpty) {
                        return AppStrings.enterValidCode;
                      }
                      return null;
                    },
                  ),



                  //____button____
                  SizedBox(
                    height: 25.h,
                  ),
                  state is ResetPasswordLoadingState
                  ?const CircularProgressIndicator()
                  :CustomElevatedButton(
                      text: AppStrings.save,
                      onPressed: () {
                        if (BlocProvider.of<ForgetPasswordCubit>(context)
                            .resetPasswordKey
                            .currentState!
                            .validate()) {
                          BlocProvider.of<ForgetPasswordCubit>(context)
                              .resetPassword();
                        }


                      },),


                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
