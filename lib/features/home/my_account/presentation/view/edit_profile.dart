import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/core/utils/common.dart';
import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_cubit.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:animeacheck/features/home/my_account/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:animeacheck/features/home/my_account/edit_profile_cubit/edit_profile_state.dart';
import 'package:animeacheck/features/home/presentation/view/home.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../detect/detectted/data/widgets/image_picker_dialog.dart';
import '../../my_account_widgets/custom_edit_profile_image_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  bool isEditing = false;
  bool isReadOnly = true;

  @override
  Widget build(BuildContext context) {
    final editProfileCubit = BlocProvider.of<EditProfileCubit>(context);
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileImageSuccessState) {
          editProfileCubit.image;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor:
              BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AppColors.darkThemBlackColor
                  : AppColors.lightPrimaryColor,
          appBar: AppBar(
            flexibleSpace: Image(
              image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? const AssetImage(
                      'lib/core/utils/appImages/images/backgroundDark.png')
                  : const AssetImage(
                      'lib/core/utils/appImages/images/background.png'),
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
          body: Stack(
            children: [
              Image.asset(
                BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                    ? (AppAssets.backgroundDark)
                    : (AppAssets.background),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Stack(children: [
                        Container(
                          height: 96.h,
                          width: 96.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(72.r))),
                          child: CustomEditProfileFileImage(
                            image: editProfileCubit.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          bottom: -13,
                          left: -13,
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ImagePickerDialog(
                                    cameraOnTap: () async {
                                      Navigator.pop(context);
                                      await pickImage(ImageSource.camera).then(
                                          (value) => editProfileCubit
                                              .editImage(value));
                                    },
                                    galleryOnTap: () async {
                                      Navigator.pop(context);
                                      await pickImage(ImageSource.gallery).then(
                                          (value) => editProfileCubit
                                              .uploadImage(value));
                                    },
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: AppColors.medicineNameColor,
                            ),
                          ),
                        )
                      ]),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: BlocProvider.of<SignUpCubit>(context)
                            .nameController,
                        prefixIcon: Icons.person_outlined,
                        hint: AppLocalizations.of(context)!.nameHint,
                        textInputAction: TextInputAction.next,
                        validate: (data) {
                          if (data!.length < 3 || data.isEmpty) {
                            return AppLocalizations.of(context)!.nameHint;
                          }
                          return null;
                        },
                        readOnly: isEditing == false ? true : false,
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
                            return AppLocalizations.of(context)!
                                .enterValidEmail;
                          }
                          return null;
                        },
                        readOnly: isEditing == false ? true : false,
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
                            return AppLocalizations.of(context)!
                                .enterValidPassword;
                          }
                          return null;
                        },
                        readOnly: isEditing == false ? true : false,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),

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
                                  isReadOnly = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isEditing
                                    ? AppColors.grayColor
                                    : AppColors.primaryColor,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.edit,
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 20.sp),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: isEditing
                                  ? () {
                                      setState(() {
                                        isEditing =
                                            false; // إلغاء تفعيل وضع التعديل
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()),
                                        );
                                      });
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isEditing
                                    ? AppColors.primaryColor
                                    : AppColors.grayColor,
                              ), // تعطيل زر Save حتى يتم تفعيل وضع التعديل
                              child: Text(
                                AppLocalizations.of(context)!.save,
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 20.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
