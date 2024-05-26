import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/my_account/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:animeacheck/features/home/my_account/edit_profile_cubit/edit_profile_state.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/appColors/app_colors.dart';
import '../../../../auth/presentation/signUp_cubit/sign_up_cubit.dart';
import '../../../my_account/my_account_widgets/custom_edit_profile_image_widget.dart';
import '../../../my_account/presentation/view/edit_profile.dart';
import '../widgets/setting_switch_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfileCubit = BlocProvider.of<EditProfileCubit>(context);

    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(
                BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                    ? (AppAssets.backgroundDark)
                    : (AppAssets.background),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              BlocConsumer<SettingsCubit, SettingsState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.account,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color:
                                        BlocProvider.of<SettingsCubit>(context)
                                                .isDarkThemEnable
                                            ? AppColors.whiteColor
                                            : AppColors.lightPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Kodchasan"),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          BlocConsumer<EditProfileCubit, EditProfileState>(
                            listener: (context, state) {
                              if (state is EditProfileImageSuccessState){
                                CustomEditProfileFileImage(
                                  image: editProfileCubit.image,
                                  fit: BoxFit.fill,
                                );
                              }
                            },
                            builder: (context, state) {
                              return Container(
                                height: 80.h,
                                width: 343.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.h),
                                  border:
                                      Border.all(color: AppColors.grayColor),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                     left: 20 ,top: 20, bottom: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        BlocProvider.of<SignUpCubit>(context)
                                            .nameController
                                            .text,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                      ),
                                CustomEditProfileFileImage(
                                  image: editProfileCubit.image,
                                  fit: BoxFit.cover,
                                ),
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            BlocProvider.of<SignUpCubit>(
                                                    context)
                                                .nameController
                                                .text,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          Text(AppLocalizations.of(context)!
                                              .profile)
                                        ],
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const EditProfileScreen()),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: BlocProvider.of<SettingsCubit>(
                                                      context)
                                                  .isDarkThemEnable
                                              ? AppColors.whiteColor
                                              : AppColors.lightPrimaryColor,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.settings,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color:
                                        BlocProvider.of<SettingsCubit>(context)
                                                .isDarkThemEnable
                                            ? AppColors.whiteColor
                                            : AppColors.lightPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Kodchasan"),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SettingSwitchCard(
                            switchValue: BlocProvider.of<SettingsCubit>(context)
                                .isArabicEnable,
                            onChange: (value) {
                              BlocProvider.of<SettingsCubit>(context)
                                  .changeCurrentLanguage(value);
                            },
                            icon: Icons.language_outlined,
                            text: AppLocalizations.of(context)!.language,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SettingSwitchCard(
                            onChange: (value) {
                              BlocProvider.of<SettingsCubit>(context)
                                  .changeNotification(value);
                            },
                            switchValue: BlocProvider.of<SettingsCubit>(context)
                                .isNotificationEnable,
                            icon: Icons.notifications_active_outlined,
                            text: AppLocalizations.of(context)!.notifications,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SettingSwitchCard(
                            onChange: (value) {
                              BlocProvider.of<SettingsCubit>(context)
                                  .changeThem(value);
                            },
                            switchValue: BlocProvider.of<SettingsCubit>(context)
                                .isDarkThemEnable,
                            icon: Icons.dark_mode_outlined,
                            text: AppLocalizations.of(context)!.darkMode,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SettingSwitchCard(
                            onChange: (value) {
                              BlocProvider.of<SettingsCubit>(context)
                                  .changeLocation(value);
                            },
                            switchValue: BlocProvider.of<SettingsCubit>(context)
                                .isLocationEnable,
                            icon: Icons.location_on_outlined,
                            text: AppLocalizations.of(context)!.country,
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
      },
    );
  }
}
