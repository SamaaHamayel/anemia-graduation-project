import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/auth/presentation/auth_cubit/sign_in_cubit.dart';
import 'package:animeacheck/features/auth/presentation/auth_cubit/sign_in_state.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../conf/routes/routes.dart';
import '../../../../core/utils/appString/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../widgets/customTextFormField.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_social_media.dart';
import '../widgets/divider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.signIn,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 24,
                color: AppColors.primaryColor,
                fontFamily: 'Kodchasan',
                fontWeight: FontWeight.w700)),
      ),
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            showToast(
                message: AppStrings.loginSuccessfully,
                state: ToastStates.success);
            navigateReplacement(context: context, route: Routes.home);
          }
          if (state is SignInErrorState) {
            showToast(message: state.message, state: ToastStates.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: BlocProvider.of<SignInCubit>(context).signInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  //___email____
                  const CustomText(
                      alignment: Alignment.bottomLeft,
                      text: AppStrings.email),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    controller:
                        BlocProvider.of<SignInCubit>(context).emailController,
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
                  SizedBox(
                    height: 24.h,
                  ),

                  //___password____
                  const CustomText(
                      alignment: Alignment.bottomLeft,
                      text: AppStrings.password),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<SignInCubit>(context)
                        .passwordController,
                    hint: AppStrings.password,
                    prefixIcon: Icons.lock_outlined,
                    isPassword: BlocProvider.of<SignInCubit>(context)
                        .isLoginPasswordShowing,
                    icon: BlocProvider.of<SignInCubit>(context).suffixIcon,
                    suffixIconOnPressed: () {
                      BlocProvider.of<SignInCubit>(context)
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
                    height: 4.h,
                  ),

                  //____text forgetPassword_____
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        navigateReplacement(
                            context: context, route: Routes.forgotPassword);
                      },
                      child: Text(
                        AppStrings.forgetPassword,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 13,
                            fontFamily: "Kodchasan",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 58.h,
                  ),

                  //____Button_____
                  state is SignInLoadingState
                      ? const Center(
                      child: CircularProgressIndicator())
                      :  CustomElevatedButton(
                    onPressed: () {
                      if (BlocProvider.of<SignInCubit>(context)
                          .signInKey
                          .currentState!
                          .validate()) {
                        BlocProvider.of<SignInCubit>(context)
                            .login();
                      }
                    },
                    text: AppStrings.signIn,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),

                  //____divider____
                  const DividerWidget(),
                  SizedBox(
                    height: 32.h,
                  ),

                  //____other way to sign in_____
                  const CustomSocialMedia(),
                  SizedBox(
                    height: 32.h,
                  ),

                  //____Text____
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.dontHaveAccount,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.blackColor,
                            fontSize: 16,
                            fontFamily: "Kodchasan",
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          navigateReplacement(context: context, route: Routes.signUp);
                        },
                        child: Text(
                          AppStrings.signUp,
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

