import 'package:animeacheck/features/auth/presentation/forgetPassword_cubit/forget_password_state.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../conf/routes/routes.dart';
import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/appImages/app_assets.dart';
import '../../../../core/utils/common.dart';
import '../forgetPassword_cubit/forget_password_cubit.dart';
import '../widgets/custom_image.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AppColors.whiteColor
                : AppColors.lightPrimaryColor,
          ),
          //              image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable? AssetImage('lib/core/utils/appImages/images/backgroundDark.png'): AssetImage('lib/core/utils/appImages/images/background.png'),
        ),
        title: Text(
          AppLocalizations.of(context)!.createNewPassword,
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
          SingleChildScrollView(
            child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccessState) {
                  //Show message
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: CircleAvatar(
                        backgroundColor: BlocProvider.of<SettingsCubit>(context)
                                .isDarkThemEnable
                            ? AppColors.whiteColor
                            : AppColors.lightPrimaryColor,
                        child: const Icon(
                          Icons.check_sharp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      content: Text(
                        AppLocalizations.of(context)!
                            .yourPasswordHasBeenChangedSuccessfully,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 16,
                                  fontFamily: "Kodchasan",
                                ),
                      ),
                      actions: [
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomElevatedButton(
                          text: AppLocalizations.of(context)!.signIn,
                          onPressed: () {
                            navigateReplacement(
                                context: context, route: Routes.home);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Form(
                  key: BlocProvider.of<ForgetPasswordCubit>(context)
                      .resetPasswordKey,
                  child: Column(
                    children: [
                      const CustomImage(imagePath: AppAssets.createNewPassword),
                      SizedBox(
                        height: 48.h,
                      ),

                      //___newPassword_____
                      CustomText(
                          alignment: Alignment.bottomLeft,
                          text: AppLocalizations.of(context)!.newPassword),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormField(
                        controller:
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .newPasswordController,
                        prefixIcon: Icons.lock_outlined,
                        hint: AppLocalizations.of(context)!.newPassword,
                        textInputAction: TextInputAction.next,
                        isPassword:
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .isNewPasswordShowing,
                        icon: BlocProvider.of<ForgetPasswordCubit>(context)
                            .newPasswordSuffixIcon,
                        suffixIconOnPressed: () {
                          BlocProvider.of<ForgetPasswordCubit>(context)
                              .changeNewPasswordSuffixIcon();
                        },
                        validate: (data) {
                          if (data!.length < 6 || data.isEmpty) {
                            return AppLocalizations.of(context)!
                                .enterValidPassword;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),

                      //____confirm NewPassword____
                      CustomText(
                          alignment: Alignment.bottomLeft,
                          text:
                              AppLocalizations.of(context)!.confirmNewPassword),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormField(
                        controller:
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .confirmPasswordController,
                        prefixIcon: Icons.lock_outlined,
                        hint: AppLocalizations.of(context)!.confirmNewPassword,
                        textInputAction: TextInputAction.next,
                        isPassword:
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .isConfirmPasswordShowing,
                        icon: BlocProvider.of<ForgetPasswordCubit>(context)
                            .confirmPasswordSuffixIcon,
                        suffixIconOnPressed: () {
                          BlocProvider.of<ForgetPasswordCubit>(context)
                              .changeConfirmPasswordSuffixIcon();
                        },
                        validate: (data) {
                          if (data!.length < 6 || data.isEmpty) {
                            return AppLocalizations.of(context)!
                                .enterValidPassword;
                          }
                          if (data !=
                              BlocProvider.of<ForgetPasswordCubit>(context)
                                  .newPasswordController
                                  .text) {
                            return AppLocalizations.of(context)!
                                .enterValidPasswordEqualTo;
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),

                      //____code_____
                      CustomText(
                          alignment: Alignment.bottomLeft,
                          text: AppLocalizations.of(context)!.code),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormField(
                        prefixIcon: Icons.code,
                        keyboardType: TextInputType.number,
                        controller:
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .codeController,
                        hint: AppLocalizations.of(context)!.code,
                        validate: (data) {
                          //123h ==> null
                          //123 ==> true & return 123
                          if (num.tryParse(data!) == null) {
                            return AppLocalizations.of(context)!.enterValidCode;
                          }
                          if (data.isEmpty) {
                            return AppLocalizations.of(context)!.enterValidCode;
                          }
                          return null;
                        },
                      ),

                      //____button____
                      SizedBox(
                        height: 25.h,
                      ),
                      state is ResetPasswordLoadingState
                          ? const CircularProgressIndicator()
                          : CustomElevatedButton(
                              text: AppLocalizations.of(context)!.save,
                              onPressed: () {
                                if (BlocProvider.of<ForgetPasswordCubit>(
                                        context)
                                    .resetPasswordKey
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<ForgetPasswordCubit>(context)
                                      .resetPassword();
                                }
                              },
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
