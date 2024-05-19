import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/help_info/presentation/view/help_info.dart';
import 'package:animeacheck/features/home/pri_home/presentation/view/pri_home.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
//resultTest

class resultTest extends StatefulWidget {
  const resultTest({Key? key}) : super(key: key);

  @override
  State<resultTest> createState() => resultState();
}

class resultState extends State<resultTest> {
  String dropdownRBC = ""; //عدد كرات الدم الحمراء
  String dropdownWCB = ""; //
  String dropdownHB = ""; // الهيمجلوبين
  String dropdownMCV = ""; // حجم كرات الدم
  String dropdownPLT = ""; //
  String dropdownMCH = ""; //
  String dropdownMCHC = "";
  String dropdownRDW = "";
  String dropdownHct = "";

  String result = '';

  void calculateResult() {
    //1
    if ((dropdownWCB == 'normal' &&
        dropdownRBC == 'normal' &&
        dropdownHB == "less" &&
        dropdownHct == "less" &&
        dropdownMCV == "less" &&
        dropdownMCH == "less" &&
        dropdownMCHC == "less" &&
        dropdownRDW == "greater" &&
        dropdownPLT == 'normal')) {
      result = 'فقر الدم الناتج عن نقص الحديد (Iron deficiency anemia)،';
    }
    //2
    else if ((dropdownWCB != "less" &&
        dropdownRBC != 'greater' &&
        dropdownHB == 'less' &&
        dropdownHct == 'less' &&
        dropdownMCV == 'less' &&
        dropdownMCH == 'less' &&
        dropdownMCHC != 'greater' &&
        dropdownRDW != "greater" &&
        dropdownPLT != 'less')) {
      result = ' انيميا البحر المتوسط (Thalassemia)';
    }
    //3,4
    else if ((dropdownWCB == "normal" &&
        dropdownRBC == 'normal' &&
        dropdownHB == "less" &&
        dropdownHct == 'less' &&
        dropdownMCV == 'greater' &&
        dropdownMCH == "less" &&
        dropdownMCHC == 'normal' &&
        dropdownRDW == "greater" &&
        dropdownPLT == 'normal')) {
      result =
          'فقر الدم الناتج عن نقص حمض الفوليك (Folic acid deficiency anemia OR /n فقر الدم الناتج عن نقص فيتامين ب12 (Vitamin B12 deficiency anemia)';
    }

    //5
    else if ((dropdownWCB == "normal" &&
        dropdownRBC == 'less' &&
        dropdownHB == 'less' &&
        dropdownHct == 'less' &&
        dropdownMCV == 'less' &&
        dropdownMCH == 'less' &&
        dropdownMCHC == 'less' &&
        dropdownRDW == 'greater' &&
        dropdownPLT == 'normal')) {
      result = 'انيميا السيكل الخلوي (Sickle cell anemia)';
    }
    //6
    else if ((dropdownWCB != "less" &&
        dropdownRBC != 'greater' &&
        dropdownHB == 'less' &&
        dropdownHct != 'greater' &&
        dropdownMCV != 'greater' &&
        dropdownMCH == "less" &&
        dropdownMCHC != 'greater' &&
        dropdownRDW == "greater" &&
        dropdownPLT == "less")) {
      result =
          'فقر الدم الناتج عن التهاب المفاصل الرثوي (Rheumatoid arthritis anemia)';
    }
    //7
    else if ((dropdownWCB == 'normal' &&
        dropdownRBC == 'normal' &&
        dropdownHB == "less" &&
        dropdownHct == 'less' &&
        dropdownMCV == 'greater' &&
        dropdownMCH == "less" &&
        dropdownMCHC == 'normal' &&
        dropdownRDW == "greater" &&
        dropdownPLT == 'normal')) {
      result = 'انيميا فول الدم (Sickle cell anemia)';
    }
   
     
    else {
      result = 'No specific condition met';
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      calculateResult();
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover, // Optional: You can set the image fit as needed
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: BlocProvider.of<SettingsCubit>(context)
                                  .isDarkThemEnable
                              ? AppColors.whiteColor
                              : AppColors.lightPrimaryColor,
                          size: 23.sp,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 85.w),
                      Text(
                        AppLocalizations.of(context)!.result,
                        style: TextStyle(
                          color: BlocProvider.of<SettingsCubit>(context)
                                  .isDarkThemEnable
                              ? AppColors.whiteColor
                              : AppColors.lightPrimaryColor,
                          fontSize: 23.sp,
                          fontFamily: 'Kodchasan',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.76,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 277,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: AppLocalizations.of(context)!
                                  .theTypeOfAnemiaYouHaveIs,
                              style: TextStyle(
                                color: BlocProvider.of<SettingsCubit>(context)
                                        .isDarkThemEnable
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                                fontSize: 24,
                                fontFamily: 'Kodchasan',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: "$result" ,
                              style: TextStyle(
                                color: Color(0xFFFF0100),
                                fontSize: 24,
                                fontFamily: 'Kodchasan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                      width: 325,
                      child: Text(
                        "The result isnot final, and there are other conditions that can affect these levels, so it is necessary to consult a doctor.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: BlocProvider.of<SettingsCubit>(context)
                                  .isDarkThemEnable
                              ? AppColors.whiteColor
                              : AppColors.lightPrimaryColor,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: 172,
                      height: 48,
                      padding: const EdgeInsets.only(
                        top: 13,
                        left: 22,
                        right: 22,
                        bottom: 12,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.50,
                            color: BlocProvider.of<SettingsCubit>(context)
                                    .isDarkThemEnable
                                ? AppColors.whiteColor
                                : AppColors.lightPrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PriHome()),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  BlocProvider.of<SettingsCubit>(context)
                                          .isDarkThemEnable
                                      ? AppColors.whiteColor
                                      : AppColors.lightPrimaryColor,
                              padding: EdgeInsets.zero,
                              textStyle: TextStyle(
                                fontFamily: 'Kodchasan',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            child:
                                Text(AppLocalizations.of(context)!.goBackHome),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Container(
                width: 172,
                height: 48,
                padding: const EdgeInsets.only(
                  top: 13,
                  left: 28,
                  right: 27,
                  bottom: 12,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFF2BB598), Color(0xFF398272)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HelpfulInformationScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.whiteColor,
                        padding: EdgeInsets.zero,
                        textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.whiteColor,
                          fontFamily: 'Kodchasan',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.helpYourself,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
