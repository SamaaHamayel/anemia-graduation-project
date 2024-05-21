import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_cubit.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:animeacheck/features/home/presentation/view/home.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
          ? AppColors.darkThemBlackColor
          : AppColors.lightPrimaryColor,
      appBar: AppBar(
        flexibleSpace: Image(
          image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
              ? AssetImage('lib/core/utils/appImages/images/backgroundDark.png')
              : AssetImage('lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        title: Text(
          AppLocalizations.of(context)!.editProfile,
          style: TextStyle(
            fontSize: 23.sp,
            color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AppColors.whiteColor
                : AppColors.lightPrimaryColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 23.sp,
            color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AppColors.whiteColor
                : AppColors.lightPrimaryColor,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : AssetImage(
                    'lib/core/utils/appImages/images/background.png',
                  ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(
                  height: 20.h,
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
                SizedBox(
                  height: 230.h,
                ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEditing = true; // تفعيل وضع التعديل
                        });
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            color: AppColors.whiteColor, fontSize: 20.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isEditing
                            ? AppColors.grayColor
                            : AppColors.primaryColor,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: isEditing
                          ? () {
                              setState(() {
                                isEditing = false; // إلغاء تفعيل وضع التعديل
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                );
                              });
                            }
                          : null, // تعطيل زر Save حتى يتم تفعيل وضع التعديل
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: AppColors.whiteColor, fontSize: 20.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isEditing
                            ? AppColors.primaryColor
                            : AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
              ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       ElevatedButton(
                //         onPressed: () {
                //           setState(() {
                //             isEditing = !isEditing;
                //           });
                //         },
                //         child: Text(
                //           'Edit',
                //           style: textStyle(
                //               color: AppColors.whiteColor,
                //               fontSize: 24,
                //               fontWeight: FontWeight.w500),
                //         ),
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: AppColors.lightPrimaryColor,
                //         ),
                //       ),
                //       ElevatedButton(
                //         onPressed: () {
                //           // Function to save the changes
                //           setState(() {
                //             isEditing = false;
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => const HomeScreen()),
                //             );
                //           });
                //         },
                //         child: Text(
                //           'Save',
                //           style: textStyle(
                //               color: AppColors.whiteColor,
                //               fontSize: 24,
                //               fontWeight: FontWeight.w500),
                //         ),
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: isEditing
                //               ? AppColors.lightPrimaryColor
                //               : AppColors.grayColor,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
