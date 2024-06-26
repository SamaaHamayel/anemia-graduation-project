import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/auth/presentation/forgetPassword_cubit/forget_password_state.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../conf/routes/routes.dart';
import '../../../../core/utils/appImages/app_assets.dart';
import '../../../../core/utils/common.dart';
import '../forgetPassword_cubit/forget_password_cubit.dart';
import '../widgets/custom_image.dart';
import '../widgets/custom_text_form_field.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';




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
          icon:  Icon(
            Icons.arrow_back_ios,
            size: 16,
            color:  BlocProvider.of<SettingsCubit>(context).isDarkThemEnable ?AppColors.whiteColor : AppColors.lightPrimaryColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.forgetPassword,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24,
              color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable ?AppColors.whiteColor : AppColors.lightPrimaryColor,
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
                            AppLocalizations.of(context)!.forgetPasswordTitle,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                     color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable ?AppColors.whiteColor : AppColors.lightPrimaryColor,
                                    fontSize: 16,
                                    fontFamily: "Kodchasan",
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
          
                      //____Email____
                       CustomText(
                          alignment: Alignment.bottomLeft,
                          text: AppLocalizations.of(context)!.email),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormField(
                        controller: BlocProvider.of<ForgetPasswordCubit>(context)
                            .emailController,
                        hint: AppLocalizations.of(context)!.emailHint,
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validate: (data) {
                          if (data!.isEmpty || !data.contains('@gmail.com')) {
                            return AppLocalizations.of(context)!.enterValidEmail;
                          }
                          return null;
                        },
                      ),
          
                      //____phone____
                      SizedBox(height: 24.h),
                      CustomText(
                          alignment: Alignment.bottomLeft,
                          text: AppLocalizations.of(context)!.phone),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomTextFormField(controller: BlocProvider.of<ForgetPasswordCubit>(context).phoneController,
                        hint: AppLocalizations.of(context)!.enterYourPhone,
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
          
                        },
                          text: AppLocalizations.of(context)!.send,),
          
          
          
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
