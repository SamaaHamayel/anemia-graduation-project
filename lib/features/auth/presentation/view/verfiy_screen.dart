import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../../../conf/routes/routes.dart';
import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/appString/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../forgetPassword_cubit/forget_password_cubit.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            navigateReplacement(context: context, route: Routes.forgotPassword);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: AppColors.primaryColor,
          ),
        ),
        title: Text(
          AppStrings.verify,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w700),
        ),
      ),

      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //___image___
            const CustomImage(imagePath: AppAssets.verify),

            //___title___
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 343.w,
                child: Text(
                  AppStrings.verifyTitle,
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
            SizedBox(
              height: 32.h,
            ),
        


            //___write code____
            VerificationCode(

              fullBorder: true,
              padding: const EdgeInsets.all(8),
              textStyle: const TextStyle(fontSize: 20.0, color: AppColors.blackColor),
              keyboardType: TextInputType.number,
              underlineColor: AppColors.primaryColor, // If this is null it will use primaryColor: Colors.red from Theme
              length: 6,
              cursorColor: AppColors.primaryColor,
              // If this is null it will default to the ambient
              // clearAll is NOT required, you can delete it
              // takes any widget, so you can implement your design
              onCompleted: (String value) {
                setState(() {
                 // _code = value;
                });
              },
              onEditing: (bool value) {
                setState(() {
                 // _onEditing = value;
                });
                //if (!_onEditing) FocusScope.of(context).unfocus();
              },
            ),



            SizedBox(
              height: 50.h,
            ),
            //____button____
            CustomElevatedButton(
                text: AppStrings.verify,
              onPressed: (){
                // if (BlocProvider.of<ForgetPasswordCubit>(context)
                //     .resetPasswordKey
                //     .currentState!
                //     .validate()) {
                //   BlocProvider.of<ForgetPasswordCubit>(context)
                //       .resetPassword();
                // }

                navigateReplacement(context: context, route: Routes.newPassword);
              },),
            SizedBox(
              height: 50.h,
            ),


            //___text____

            InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 2, // Space between underline and text
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: AppColors.lightRedColor,
                      width: 1.0, // Underline thickness
                    ))
                ),
                child: const Text(
                  AppStrings.resentCode,
                  style: TextStyle(
                    color: AppColors.lightRedColor,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),


    );
  }
}
