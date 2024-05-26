import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_cubit.dart';
import 'package:animeacheck/features/auth/presentation/view/info_one_screen.dart';
import 'package:animeacheck/features/auth/presentation/view/sign_in_screen.dart';
import 'package:animeacheck/features/home/medicine/presentation/view/medicine_screen.dart';
import 'package:animeacheck/features/home/medicine/presentation/view/no_medicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/my_account/presentation/view/edit_profile.dart';

import '../../../chatBot/chat_bot_view.dart';
import '../../../setting/presentation/settings_cubit/settings_cubit.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => MyAccountState();
}

class MyAccountState extends State<MyAccount> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? const AssetImage(
                      'lib/core/utils/appImages/images/backgroundDark.png')
                  : const AssetImage(
                      'lib/core/utils/appImages/images/background.png'),
              fit:
                  BoxFit.cover, // Optional: You can set the image fit as needed
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  buildHeader(),
                    buildProfileCard(),
                    SizedBox(height: 28.h),
                    buildActionCard(
                      icon: Icons.person_2_outlined,
                      title: AppLocalizations.of(context)!.profile,
                      //goBackHome
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfileScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 28.h),
                    buildActionCard(
                      icon: Icons.smart_toy_outlined,
                      title: AppLocalizations.of(context)!.chat,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ChatBotView()),
                        );
                      },
                    ),
                    SizedBox(height: 28.h),
                    buildActionCard(
                      icon: Icons.storage,
                      title: AppLocalizations.of(context)!.myData,
                      //myData
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoOneScreen()),
                        );
                        // Navigate to information page
                      },
                    ),
                    SizedBox(height: 28.h),
                    buildNotificationCard(),
                    SizedBox(height: 45.h),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.logOut,
                        //logOut
                        style: TextStyle(
                          color: const Color(0xFFFF0404),
                          fontSize: 18.sp,
                          fontFamily: 'Kodchasan',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Container(
        width: 345.w,
        height: 80.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: const Color(0xFFE6E4E4)),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor:
                    BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                        ? AppColors.whiteColor
                        : AppColors.lightPrimaryColor,
                child: Image.asset(

                  AppAssets.female,
                  width: double.infinity,
                ),
              ),
              Text(
                BlocProvider.of<SignUpCubit>(context).nameController.text,
                style: TextStyle(
                  // color: Colors.black.withOpacity(0.9),
                  fontSize: 16.sp,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 100.w),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfileScreen()),
                  );
                },
                icon: Icon(
                  Icons.border_color_outlined,
                  color:
                      BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                          ? AppColors.whiteColor
                          : AppColors.lightPrimaryColor,
                  size: 30.0.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionCard(
      {required IconData icon,
      required String title,
      required Function() onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 00.0),
      child: Container(
        width: 330.w,
        height: 56.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: AppColors.lightGrayColor),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                    ? AppColors.whiteColor
                    : AppColors.lightPrimaryColor,
                size: 30.0.sp,
              ),
              Text(
                title,
                style: TextStyle(
                  //color: Colors.black.withOpacity(0.9),
                  fontSize: 12.sp,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 100.w),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color:
                      BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                          ? AppColors.whiteColor
                          : AppColors.lightPrimaryColor,
                  size: 20.0.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 00.0),
      child: Container(
        width: 330.w,
        height: 56.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.assignment_add,
                color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                    ? AppColors.whiteColor
                    : AppColors.lightPrimaryColor,
                size: 30.0.sp,
              ),
              TextButton(
                onPressed: () {
                  if (isSwitched == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MedicineScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NoMedicineScreen()),
                    );
                  }
                },
                child: Text(
                  AppLocalizations.of(context)!.medicineReminder,
                  style: TextStyle(
                    //    color: Colors.black.withOpacity(0.8),
                    fontSize: 13.sp,
                    fontFamily: 'Kodchasan',
                    fontWeight: FontWeight.w600,
                  ),
                ), // Text to display on the button
              ),
              SizedBox(width: 50.w),
              Switch(
                activeColor: AppColors.lightPrimaryColor,
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
