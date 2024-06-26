import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_cubit.dart';
import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_state.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../conf/routes/routes.dart';
import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/appImages/app_assets.dart';
import '../../../../core/utils/common.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../home/setting/presentation/settings_cubit/settings_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Image(
          image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
              ? const AssetImage(
              'lib/core/utils/appImages/images/backgroundDark.png')
              : const AssetImage(
              'lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        leading: IconButton(
          onPressed: () {
            navigateReplacement(context: context, route: Routes.signIn);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AppColors.whiteColor
                : AppColors.lightPrimaryColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.signUp,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24,
              color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AppColors.whiteColor
                  : AppColors.lightPrimaryColor,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? (AppAssets.backgroundDark)
                : (AppAssets.background),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpLoadingState){
                void showToast() {
                  Fluttertoast.showToast(
                    msg: "Wait a second",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: AppColors.greenColor,
                    textColor: AppColors.whiteColor,
                    fontSize: 16.0,
                  );
                }
                showToast();
              //  navigateReplacement(context: context, route: Routes.signIn);
              }
              if (state is SignUpSuccessState) {
                showToast(
                    message: AppLocalizations.of(context)!.checkYourEmail,
                    state: ToastStates.success);
                navigateReplacement(context: context, route: Routes.infoOne);
              }
              if (state is SignUpErrorState) {
                showToast(message: state.message, state: ToastStates.error);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(top: 38),
                child: Form(
                  key: BlocProvider.of<SignUpCubit>(context).signUpKey,
                  child: Column(
                    children: [
                      //_____name____
                      CustomText(
                          color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable?
                          AppColors.whiteColor : AppColors.lightPrimaryColor,
                          alignment: Alignment.bottomLeft,
                          text: AppLocalizations.of(context)!.name),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormField(
                        controller:
                            BlocProvider.of<SignUpCubit>(context).nameController,
                        prefixIcon: Icons.person_outlined,
                        hint: AppLocalizations.of(context)!.nameHint,
                        textInputAction: TextInputAction.next,
                        validate: (data) {
                          if (data!.length < 3 || data.isEmpty) {
                            return AppLocalizations.of(context)!.nameHint;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),

                      //____email____
                      CustomText(
                          color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable?
                          AppColors.whiteColor : AppColors.lightPrimaryColor,
                          alignment: Alignment.bottomLeft,
                          text: AppLocalizations.of(context)!.email),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormField(
                        controller: BlocProvider.of<SignUpCubit>(context)
                            .signUpEmailController,
                        prefixIcon: Icons.email_outlined,
                        hint: AppLocalizations.of(context)!.emailHint,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validate: (data) {
                          if (data!.isEmpty || !data.contains('@gmail.com')) {
                            return AppLocalizations.of(context)!.enterValidEmail;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),

                      //___password_____
                      CustomText(
                          color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable?
                          AppColors.whiteColor : AppColors.lightPrimaryColor,
                          alignment: Alignment.bottomLeft,
                          text: AppLocalizations.of(context)!.password),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormField(
                        controller: BlocProvider.of<SignUpCubit>(context)
                            .signUpPasswordController,
                        prefixIcon: Icons.lock_outlined,
                        hint: AppLocalizations.of(context)!.passwordHint,
                        textInputAction: TextInputAction.next,
                        isPassword: BlocProvider.of<SignUpCubit>(context)
                            .isSignUpPasswordShowing,
                        icon: BlocProvider.of<SignUpCubit>(context).suffixIcon,
                        suffixIconOnPressed: () {
                          BlocProvider.of<SignUpCubit>(context)
                              .changeLoginPasswordSuffixIcon();
                        },
                        validate: (data) {
                          if (data!.length < 3 || data.isEmpty) {
                            return AppLocalizations.of(context)!.enterValidPassword;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),

                      //____confirm password____
                      CustomText(
                          color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable?
                          AppColors.whiteColor : AppColors.lightPrimaryColor,
                          alignment: Alignment.bottomLeft,
                          text: AppLocalizations.of(context)!.confirmPassword),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormField(
                        controller: BlocProvider.of<SignUpCubit>(context)
                            .confirmPasswordController,
                        prefixIcon: Icons.lock_outlined,
                        hint: AppLocalizations.of(context)!.confirmPassword,
                        isPassword: BlocProvider.of<SignUpCubit>(context)
                            .isSignUpPasswordShowing,
                        icon: BlocProvider.of<SignUpCubit>(context).suffixIcon,
                        suffixIconOnPressed: () {
                          BlocProvider.of<SignUpCubit>(context)
                              .changeLoginPasswordSuffixIcon();
                        },
                        validate: (data) {
                          if (data!.length < 3 || data.isEmpty) {
                            return AppLocalizations.of(context)!.enterValidPassword;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 32.h,
                      ),

                      //_____button_____
                      state is SignUpLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : CustomElevatedButton(
                              text: AppLocalizations.of(context)!.signUp,
                              onPressed: () {
                                if (BlocProvider.of<SignUpCubit>(context)
                                    .signUpKey
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<SignUpCubit>(context).signUp();
                                }
                                //navigateReplacement(context: context, route: Routes.infoOne);
                              },
                            ),
                      SizedBox(
                        height: 41.h,
                      ),

                      //____divider____


                      //____text_____
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.alreadyHaveAnAccount,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 16,
                                fontFamily: "Kodchasan",
                                fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {
                              navigateReplacement(
                                  context: context, route: Routes.signIn);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.signIn,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: BlocProvider.of<SettingsCubit>(context)
                                              .isDarkThemEnable
                                          ? AppColors.lightPrimaryColor
                                          : AppColors.lightPrimaryColor,
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
        ],
      ),
    );
  }
}
