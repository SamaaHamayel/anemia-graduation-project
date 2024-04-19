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
import '../../../../core/utils/commens.dart';
import '../signUp_cubit/sign_up_cubit.dart';
import '../widgets/customTextFormField.dart';
import '../widgets/custom_image.dart';
import '../widgets/custom_text.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

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
            if(state is SendCodeSuccess){
              //Show message
              showToast(message: AppStrings.checkEmail, state: ToastStates.success);
              //Navigate to change password screen
              navigateReplacement(context: context, route: Routes.verify);
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
                    height: 55.h,
                  ),

                  //____button____
                  CustomElevatedButton(
                      text: AppStrings.save,
                      onPressed: () {
                        if (BlocProvider.of<ForgetPasswordCubit>(context)
                            .resetPasswordKey
                            .currentState!
                            .validate()) {
                          // BlocProvider.of<ForgetPasswordCubit>(context)
                          //     .resetPassword();
                        }

                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
