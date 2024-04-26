import 'package:animeacheck/core/cache_helper/cache_helper.dart';
import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_cubit.dart';
import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_state.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_social_media.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text.dart';
import 'package:animeacheck/features/auth/presentation/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../conf/routes/routes.dart';
import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/appString/app_strings.dart';
import '../../../../core/utils/common.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
          AppStrings.signUp,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            showToast(
                message: AppStrings.loginSuccessfully,
                state: ToastStates.success);
            navigateReplacement(context: context, route: Routes.infoOne);
          }
          if (state is SignUpErrorState) {
            showToast(message: state.message, state: ToastStates.error);
          }        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 38),
            child: Form(
              key: BlocProvider.of<SignUpCubit>(context).signUpKey,
              child: Column(
                children: [
                  //_____name____
                  const CustomText(
                    alignment: Alignment.bottomLeft,
                      text: AppStrings.name),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<SignUpCubit>(context).nameController,
                    prefixIcon: Icons.person_outlined,
                    hint: AppStrings.nameHint,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  //____email____
                  const CustomText(alignment: Alignment.bottomLeft,text: AppStrings.email),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<SignUpCubit>(context).signUpEmailController,
                    prefixIcon: Icons.email_outlined,
                    hint: AppStrings.emailHint,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validate: (data) {
                      if (data!.isEmpty || !data.contains('@gmail.com')) {
                        return AppStrings.enterValidEmail;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  //___password_____
                  const CustomText(alignment: Alignment.bottomLeft,text: AppStrings.password),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<SignUpCubit>(context).signUpPasswordController,
                    prefixIcon: Icons.lock_outlined,
                    hint: AppStrings.passwordHint,
                    textInputAction: TextInputAction.next,
                    isPassword: BlocProvider.of<SignUpCubit>(context)
                        .isSignUpPasswordShowing,
                    icon: BlocProvider.of<SignUpCubit>(context).suffixIcon,
                    suffixIconOnPressed: () {
                      BlocProvider.of<SignUpCubit>(context)
                          .changeLoginPasswordSuffixIcon();
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

                  //____confirm password____
                  const CustomText(alignment: Alignment.bottomLeft,text: AppStrings.confirmPassword),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<SignUpCubit>(context).confirmPasswordController,
                    prefixIcon: Icons.lock_outlined,
                    hint: AppStrings.confirmPassword,
                    isPassword: BlocProvider.of<SignUpCubit>(context)
                        .isSignUpPasswordShowing,
                    icon: BlocProvider.of<SignUpCubit>(context).suffixIcon,
                    suffixIconOnPressed: () {
                      BlocProvider.of<SignUpCubit>(context)
                          .changeLoginPasswordSuffixIcon();
                    },
                    validate: (data) {
                      if (data!.length < 6 || data.isEmpty) {
                        return AppStrings.enterValidPassword;
                      }
                      return null;
                    },

                  ),
                  SizedBox(
                    height: 32.h,
                  ),


                  //_____button_____
                  state is SignUpLoadingState
                      ? const Center(
                      child: CircularProgressIndicator())
                      : CustomElevatedButton(
                      text: AppStrings.signUp,
                      onPressed: (){
                        if (BlocProvider.of<SignUpCubit>(context)
                            .signUpKey
                            .currentState!
                            .validate()) {
                          BlocProvider.of<SignUpCubit>(context)
                              .signUp();
                        }

                        //navigateReplacement(context: context, route: Routes.infoOne);


                      },),
                  SizedBox(
                    height: 41.h,
                  ),

                  //____divider____
                  const DividerWidget(),
                  SizedBox(
                    height: 32.h,
                  ),


                  //____another way to sign up_____
                  const CustomSocialMedia(),
                  SizedBox(
                    height: 40.h,
                  ),


                  //____text_____
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.alreadyHaveAnAccount,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.blackColor,
                            fontSize: 16,
                            fontFamily: "Kodchasan",
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          navigateReplacement(context: context, route: Routes.signIn);
                        },
                        child: Text(
                          AppStrings.signIn,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontFamily: "Kodchasan",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
