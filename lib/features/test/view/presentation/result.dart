import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/pri_home/presentation/view/pri_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//resultTest

class resultTest extends StatefulWidget {
  const resultTest({Key? key}) : super(key: key);

  @override
  State<resultTest> createState() => resultState();
}

class resultState extends State<resultTest> {
  String dropdownRBC = "normal"; //عدد كرات الدم الحمراء
  String dropdownWCB = "normal"; //
  String dropdownHB = "normal"; // الهيمجلوبين
  String dropdownMCV = "normal"; // حجم كرات الدم
  String dropdownPLT = "normal"; //
  String dropdownMCH = "normal"; //
  String dropdownMCHC = "normal"; //

  String result = '';

  void calculateResult() {
    if ((
            // dropdownRBC == "less" && //عدد كرات الدم الحمراء
            // dropdownWCB == "normal" && //
            // dropdownHB == "normal" && // الهيمجلوبين
            // dropdownMCV == "normal" && // حجم كرات الدم
            // dropdownPLT == "normal" && //
            // dropdownMCH == "normal" && //
            // dropdownMCHC == "normal"
            dropdownRBC == 'less' &&
                dropdownHB == 'less' &&
                dropdownMCV == 'normal' &&
                dropdownWCB != 'greater' &&
                dropdownPLT != 'greater' &&
                dropdownMCH == "normal" &&
                dropdownMCHC == "normal")
        //لو جاى ف حادثة يبقي عندخ نزيف داخلى او لو بنت ف وقت البريود

        ) {
      result = 'num1';
    } else if (dropdownRBC == 'less' &&
        dropdownHB == 'less' &&
        dropdownMCV == 'normal' &&
        dropdownWCB != 'greater' &&
        dropdownPLT != 'greater' &&
        dropdownMCH != "normal" &&
        dropdownMCHC != "normal") {
      result = "num 1";
    } else if (dropdownRBC == 'less' &&
        dropdownHB == 'less' &&
        dropdownMCH == 'less' &&
        dropdownMCHC == 'less' &&
        dropdownMCV == 'less') {
      //سوء تغذية او انيميا البحر المتوسط
      result = 'سوء تغذية او انيميا البحر المتوسط';
    } else if (dropdownRBC == 'less' &&
        dropdownHB == 'less' &&
        dropdownMCV == 'greater') {
      //B12 او ان الشخص نباتي فوليك اسيك
      result = 'num3';
    } else if (dropdownRBC == 'less' &&
        dropdownHB == 'less' &&
        dropdownMCV == 'normal') {
      //ممكن تبقي مشكلة ف الكبد
      //انيميا تكسيرية

      result = 'num4';
    } else if (dropdownRBC != 'normal' &&
        dropdownHB == 'less' &&
        dropdownWCB != 'normal' &&
        dropdownPLT == 'less') {
      result = 'num5';
    } else if (dropdownRBC == "normal" && //عدد كرات الدم الحمراء
            dropdownWCB == "normal" && //
            dropdownHB == "normal" && // الهيمجلوبين
            dropdownMCV == "normal" && // حجم كرات الدم
            dropdownPLT == "normal" && //
            dropdownMCH == "normal" && //
            dropdownMCHC == "normal" //
        ) {
      result = "num 6";
    } else {
      result = 'No specific condition met';
    }
  }
// void calculateResult() {
  //   switch (result) {
  //     case "1":
  //       (dropdownRBC == 'less' &&
  //           dropdownHB == 'less' &&
  //           dropdownMCV == 'normal' &&
  //           dropdownWCB != 'greater' &&
  //           dropdownPLT != 'greater' &&
  //           dropdownMCH == "normal" &&
  //           dropdownMCHC == "normal");
  //       result = 'num1';
  //       break;
  //     case "6":
  //       (dropdownRBC == 'less' &&
  //           dropdownHB == 'less' &&
  //           dropdownMCV == 'normal' &&
  //           dropdownWCB != 'greater' &&
  //           dropdownPLT != 'greater' &&
  //           dropdownMCH != "normal" &&
  //           dropdownMCHC != "normal");
  //       result = 'num1';
  //       break;
  //     case "2":
  //       (dropdownRBC == 'less' &&
  //           dropdownHB == 'less' &&
  //           dropdownMCH == 'less' &&
  //           dropdownMCHC == 'less' &&
  //           dropdownMCV == 'less');
  //       result = 'سوء تغذية او انيميا البحر المتوسط';
  //       break;
  //     case "3":
  //       (dropdownRBC == 'less' &&
  //           dropdownHB == 'less' &&
  //           dropdownMCV == 'greater');
  //       result = 'num3';
  //       break;
  //     case "4":
  //       (dropdownRBC == 'less' &&
  //           dropdownHB == 'less' &&
  //           dropdownMCV == 'normal');
  //       result = 'num4';
  //       break;
  //     case "5":
  //       (dropdownRBC != 'normal' &&
  //           dropdownHB == 'less' &&
  //           dropdownWCB != 'normal' &&
  //           dropdownPLT == 'less');
  //       result = 'num5';
  //       break;
  //     default:
  //       result = 'No specific condition met';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    setState(() {
      calculateResult();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                        color: AppColors.lightPrimaryColor,
                        size: 23.sp,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 85.w),
                    Text(
                      'Result',
                      style: TextStyle(
                        color: AppColors.lightPrimaryColor,
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
                            text: 'The type of anemia you have is:\n\n',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 24,
                              fontFamily: 'Kodchasan',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: "$result",
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
                Center(
                  child: Container(
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
                            setState(() {
                              calculateResult();
                            });
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            textStyle: TextStyle(
                                fontFamily: 'Kodchasan',
                                fontWeight: FontWeight.w900,
                                color: AppColors.primaryColor),
                          ),
                          child: Text('top to see'),
                        ),
                      ],
                    ),
                  ),
                ),
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
                        side: BorderSide(width: 1.50, color: Color(0xFF2BB598)),
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
                            foregroundColor: AppColors.lightPrimaryColor,
                            padding: EdgeInsets.zero,
                            textStyle: TextStyle(
                              fontFamily: 'Kodchasan',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          child: Text('GO back home'),
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
                        MaterialPageRoute(builder: (context) => resultTest()),
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
                    child: Text('Get a doctor'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
