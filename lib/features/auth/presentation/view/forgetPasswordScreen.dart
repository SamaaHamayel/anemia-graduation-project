import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/auth/presentation/forgetPassword_cubit/forget_password_state.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../conf/routes/routes.dart';
import '../../../../core/utils/appImages/images/app_assets.dart';
import '../../../../core/utils/appString/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../forgetPassword_cubit/forget_password_cubit.dart';
import '../widgets/customTextFormField.dart';
import '../widgets/custom_image.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            navigateReplacement(context: context, route: Routes.signIn);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: AppColors.primaryColor,
          ),
        ),
        title: Text(
          AppStrings.forgetPassword,
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
              showToast(message: state.message, state: ToastStates.success);
              //Navigate to change password screen
              navigateReplacement(context: context, route: Routes.verify);
            }          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
              child: Column(
                children: [
                  //___image___
                  const CustomImage(imagePath: AppAssets.forgetPassword),
                  SizedBox(height: 32.h),

                  //___imageTitle____
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 343.w,
                      child: Text(
                        AppStrings.forgetPasswordTitle,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontFamily: "Kodchasan",
                                fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  //____Email____
                  const CustomText(
                      alignment: Alignment.bottomLeft,
                      text: AppStrings.email),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<ForgetPasswordCubit>(context)
                        .emailController,
                    hint: AppStrings.emailHint,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validate: (data) {
                      if (data!.isEmpty || !data.contains('@gmail.com')) {
                        return AppStrings.enterValidEmail;
                      }
                      return null;
                    },
                  ),

                  //____phone____
                  SizedBox(height: 24.h),
                  CustomText(
                      alignment: Alignment.bottomLeft,
                      text: AppStrings.phone),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<ForgetPasswordCubit>(context)
                        .phoneController,
                    hint: AppStrings.enterYourPhone,
                    prefixIcon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 32.h),

                  state is SendCodeLoading
                      ? const Center(
                      child: CircularProgressIndicator())
                      :CustomElevatedButton(
                    onPressed: () {
                      if (BlocProvider.of<ForgetPasswordCubit>(context)
                          .sendCodeKey
                          .currentState!
                          .validate()) {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .sendCode();
                      }
                      navigateReplacement(context: context, route: Routes.verify);

                    },
                      text: AppStrings.send,),



                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
