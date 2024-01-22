import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/auth/presentation/auth_cubit/sign_in_cubit.dart';
import 'package:animeacheck/features/auth/presentation/auth_cubit/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../conf/routes/routes.dart';
import '../../../../core/utils/appString/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../widgets/customTextFormField.dart';

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
                  SizedBox(height: 50.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(AppStrings.email,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 13,
                      fontFamily: "Kodchasan",
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                  SizedBox(height: 16.h,),

                  //!! email
                  CustomTextFormField(
                    controller:
                        BlocProvider.of<SignInCubit>(context).emailController,
                    hint: AppStrings.emailHint,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validate: (data) {
                      if (data!.isEmpty || !data.contains('@gmail.com')) {
                        return AppStrings.enterValidEmail;
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 24.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(AppStrings.password,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 13,
                        fontFamily: "Kodchasan",
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                  SizedBox(height: 16.h,),

                  //!! password
                  CustomTextFormField(
                    controller: BlocProvider.of<SignInCubit>(context)
                        .passwordController,
                    hint: AppStrings.password,
                    prefixIcon: Icons.lock_outlined,
                    isPassword: BlocProvider.of<SignInCubit>(context)
                        .isLoginPasswordShowing,
                    icon:
                    BlocProvider.of<SignInCubit>(context).suffixIcon,
                    suffixIconOnPressed: () {
                      BlocProvider.of<SignInCubit>(context)
                          .changeLoginPasswordSuffixIcon();
                    },
                    validate: (data) {
                      if (data!.length < 6 || data.isEmpty) {
                        return AppStrings.enterValidPassword
                            ;
                      }
                      return null;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16,top: 4,right: 16),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(AppStrings.forgetPassword,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 13,
                          fontFamily: "Kodchasan",
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                  SizedBox(height: 58.h,),

                  // Ink(
                  //   padding: EdgeInsets.zero,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     gradient: LinearGradient(
                  //       begin: Alignment(.05, -1),
                  //       end: Alignment(-.05, 1),
                  //       stops: [.5, .5],
                  //       colors: <Color>[
                  //         Color(0xFF2BB598),
                  //         Color(0xFF398272),
                  //       ],
                  //     ),
                  //   ),
                  //   child: ElevatedButton(onPressed: (){},
                  //     child: Text(AppStrings.signIn,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  //         color: AppColors.whiteColor,
                  //         fontSize: 20,
                  //         fontFamily: "Kodchasan",
                  //         fontWeight: FontWeight.w700
                  //     ),),
                  //     style: ElevatedButton.styleFrom(
                  //        shadowColor: Color(0xFF398272),
                  //        backgroundColor: Color(0xFF2BB598),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //     ),
                  //   ),
                  // ),





                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 343.w,
                      height: 56.h,
                      child: ElevatedButton(onPressed: (){},
                          child: Text(AppStrings.signIn,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.whiteColor,
                              fontSize: 20,
                              fontFamily: "Kodchasan",
                              fontWeight: FontWeight.w700
                          ),),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Color(0xFF398272),
                          backgroundColor: Color(0xFF2BB598),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                      ),
                      ),
                    ),
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
