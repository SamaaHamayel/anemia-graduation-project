import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:animeacheck/features/test/view/presentation/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CBCInputField extends StatelessWidget {
  final String label;
  final String value;
  final List<String> options;
  final Function(String) onChanged;

  const CBCInputField({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 30.h),
              child: Text(
                '$label:',
                style: TextStyle(
                  color:
                      BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                  fontSize: 25.sp,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.w),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.5.w, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color:
                        BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                            ? AppColors.darkGreen
                            : AppColors.lightBackgroundColor,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: DropdownButton<String>(
                  dropdownColor:
                      BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                          ? AppColors.darkGreen
                          : AppColors.whiteColor,
                  value: value,
                  elevation: 8,
                  icon: Icon(
                    Icons.expand_more,
                    color: AppColors.lightPrimaryColor,
                    size: 30.sp,
                  ),
                  style: TextStyle(
                    color: AppColors.lightPrimaryColor,
                    fontSize: 23.h,
                    fontWeight: FontWeight.w400,
                  ),
                  iconEnabledColor:
                      BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                          ? AppColors.darkGreen
                          : AppColors.lightBackgroundColor,
                  iconDisabledColor:
                      BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                          ? AppColors.lightGrayColor
                          : AppColors.lightGrayColor,
                  underline: Container(
                    height: 0.h,
                    color: AppColors.lightPrimaryColor,
                  ),
                  onChanged: (newValue) => onChanged(newValue!),
                  items: options
                      .map<DropdownMenuItem<String>>(
                        (option) => DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.w),
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.w,
                  color:
                      BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                          ? AppColors.whiteColor
                          : AppColors.lightPrimaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CBCTest extends StatefulWidget {
  const CBCTest({Key? key}) : super(key: key);

  @override
  State<CBCTest> createState() => CBCTestState();
}

class CBCTestState extends State<CBCTest> {
  String dropdownRBC = "normal";
  String dropdownWCB = "normal";
  String dropdownHB = "normal";
  String dropdownMCV = "normal";
  String dropdownPLT = "normal";
  String dropdownMCH = "normal";
  String dropdownMCHC = "normal";
  String dropdownRDW = "normal";
  String dropdownHct = "normal";
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
              ? const AssetImage(
                  'lib/core/utils/appImages/images/backgroundDark.png')
              : const AssetImage(
                  'lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
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
              'CBC Test',
              style: TextStyle(
                color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
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
            padding: EdgeInsets.symmetric(horizontal: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(9.w),
                  child: SizedBox(
                    child: Text(
                      AppLocalizations.of(context)!.enterTheResult,
                      //enterTheResult
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: BlocProvider.of<SettingsCubit>(context)
                                .isDarkThemEnable
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                        fontSize: 22.sp,
                        fontFamily: 'Kumbh Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.h,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CBCInputField(
                          label: 'RBC',
                          value: dropdownRBC,
                          options: const ['normal', 'less', 'greater'],
                          onChanged: (newValue) {
                            setState(() {
                              dropdownRBC = newValue;
                            });
                          },
                        ),
                        CBCInputField(
                          label: 'WCB',
                          value: dropdownWCB,
                          options: const ['normal', 'less', 'greater'],
                          onChanged: (newValue) {
                            setState(() {
                              dropdownWCB = newValue;
                            });
                          },
                        ),
                        CBCInputField(
                          label: ' HB  ',
                          value: dropdownHB,
                          options: const ['normal', 'less', 'greater'],
                          onChanged: (newValue) {
                            setState(() {
                              dropdownHB = newValue;
                            });
                          },
                        ),
                        CBCInputField(
                          label: 'MCV',
                          value: dropdownMCV,
                          options: const ['normal', 'less', 'greater'],
                          onChanged: (newValue) {
                            setState(() {
                              dropdownMCV = newValue;
                            });
                          },
                        ),
                        CBCInputField(
                          label: 'PLT ',
                          value: dropdownPLT,
                          options: const ['normal', 'less', 'greater'],
                          onChanged: (newValue) {
                            setState(() {
                              dropdownPLT = newValue;
                            });
                          },
                        ),
                        CBCInputField(
                          label: 'MCH',
                          value: dropdownMCH,
                          options: const ['normal', 'less', 'greater'],
                          onChanged: (newValue) {
                            setState(() {
                              dropdownMCH = newValue;
                            });
                          },
                        ),
                        CBCInputField(
                          label: 'RDW',
                          value: dropdownRDW,
                          options: const ['normal', 'less', 'greater'],
                          onChanged: (newValue) {
                            setState(() {
                              dropdownRDW = newValue;
                            });
                          },
                        ),
                        CBCInputField(
                          label: 'Hct',
                          value: dropdownHct,
                          options: const ['normal', 'less', 'greater'],
                          onChanged: (newValue) {
                            setState(() {
                              dropdownHct = newValue;
                            });
                          },
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            CBCInputField(
                              label: 'MCHC',
                              value: dropdownMCHC,
                              options: const ['normal', 'less', 'greater'],
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownMCHC = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      width: 172.w,
                      height: 48.h,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            AppColors.lightPrimaryColor,
                            AppColors.primaryColor
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          calculateResult();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultTest(result: result),
                            ),
                          );
                          setState(() {});
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
                        child: Text(AppLocalizations.of(context)!.seeTheResult),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
      result =
          '\n  \n فقر الدم الناتج عن نقص الحديد  \n (Iron deficiency anemia)،\n \n \n ';
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
      result = ' \n  \n  انيميا البحر المتوسط (Thalassemia) \n \n \n ';
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
          '\n  \n فقر الدم الناتج عن نقص حمض الفوليك \n  (Folic acid deficiency anemia \n'
          "\n"
          'OR '
          '\n   فقر الدم الناتج عن نقص فيتامين ب12 \n  (Vitamin B12 deficiency anemia)\n ';
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
      result = '\n  \n انيميا السيكل الخلوي \n (Sickle cell anemia) \n \n \n ';
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
          '\n \n  فقر الدم الناتج عن التهاب المفاصل الرثوي  \n (Rheumatoid arthritis anemia) \n \n \n ';
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
      result = '\n \n  انيميا فول الدم \n  (Sickle cell anemia) \n \n \n ';
    } else {
      result = '\n  \n  No specific condition met \n '
          'لم يتم التطابق '
          '\n \n ';
    }
  }
}
