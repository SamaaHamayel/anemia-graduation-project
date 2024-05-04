import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/help_info/presentation/view/help_info.dart';
import 'package:animeacheck/features/test/view/presentation/cbc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class notificationScreen extends StatelessWidget {
  const notificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                            SizedBox(width: 50.w),
                            Text(
                              'notification',
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
                        Container(
                          width: 375.w,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2.w,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFEEEEEE),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 343.w,
                          height: 111.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 28.h,
                                top: 44.h,
                                child: SizedBox(
                                  width: 277.w,
                                  child: Text(
                                    'Your eyelid image is complete!\nCheck the app for results on possible anemia.\nThanks for using our app.',
                                    style: TextStyle(
                                      color: Color(0xFF8A8989),
                                      fontSize: 12.sp,
                                      fontFamily: 'Kodchasan',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 16.h,
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Icon(
                                          Icons.waving_hand_outlined,
                                          color: AppColors.lightPrimaryColor,
                                          size: 25.0.sp,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      SizedBox(
                                        // width: 44,
                                        child: Text(
                                          'Hello,',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                            fontFamily: 'Kodchasan',
                                            fontWeight: FontWeight.w700,
                                            // height: 0.11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 280,
                                top: 16.h,
                                child: SizedBox(
                                  width: 44.w,
                                  child: Text(
                                    '23 min',
                                    style: TextStyle(
                                      color: Color(0xFF8A8989),
                                      fontSize: 11.sp,
                                      fontFamily: 'Kodchasan',
                                      fontWeight: FontWeight.w700,
                                      height: 0.12.h,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 375.w,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.w,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFEEEEEE),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 343.w,
                          height: 111.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 28.w,
                                top: 44.h,
                                child: SizedBox(
                                    width: 277.w,
                                    child: Text(
                                      'Your appointment is scheduled for next Wednesday at 10 AM. Please ensure to confirm the appointment and arrive on time. Thank you',
                                      style: TextStyle(
                                        color: Color(0xFF8A8989),
                                        fontSize: 12,
                                        fontFamily: 'Kodchasan',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                              ),
                              Positioned(
                                left: 0,
                                top: 16.h,
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Icon(
                                          Icons.language,
                                          color: AppColors.lightPrimaryColor,
                                          size: 25.0.sp,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      SizedBox(
                                        // width: 44,
                                        child: Text(
                                          'Doctor,',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                            fontFamily: 'Kodchasan',
                                            fontWeight: FontWeight.w700,
                                            // height: 0.11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 270.h,
                                top: 16.h,
                                child: SizedBox(
                                  width: 44.w,
                                  child: Text(
                                    '30 min',
                                    style: TextStyle(
                                      color: Color(0xFF8A8989),
                                      fontSize: 11.sp,
                                      fontFamily: 'Kodchasan',
                                      fontWeight: FontWeight.w700,
                                      height: 0.12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HelpfulInformationScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Change appointment',
                              style: TextStyle(
                                color: Color(0xFF99C4BC),
                                fontSize: 12.sp,
                                fontFamily: 'Kodchasan',
                                fontWeight: FontWeight.w700,
                                height: 0.12.h,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 375.w,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.w,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFEEEEEE),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 343.w,
                          height: 111.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 28.h,
                                top: 44.h,
                                child: SizedBox(
                                    width: 277.w,
                                    child: Text(
                                      'According to the analysis, you are diagnosed with iron deficiency anemia. Please consult a healthcare professional for further evaluation and treatment options.',
                                      style: TextStyle(
                                        color: Color(0xFF8A8989),
                                        fontSize: 12.sp,
                                        fontFamily: 'Kodchasan',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                              ),
                              Positioned(
                                left: 0,
                                top: 16.h,
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Icon(
                                          Icons.science_outlined,
                                          color: AppColors.lightPrimaryColor,
                                          size: 25.0.sp,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      SizedBox(
                                        // width: 44,
                                        child: Text(
                                          'Test,',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                            fontFamily: 'Kodchasan',
                                            fontWeight: FontWeight.w700,
                                            // height: 0.11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 265.h,
                                top: 16.h,
                                child: SizedBox(
                                  width: 44.w,
                                  child: Text(
                                    '40 min',
                                    style: TextStyle(
                                      color: Color(0xFF8A8989),
                                      fontSize: 11.sp,
                                      fontFamily: 'Kodchasan',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HelpfulInformationScreen()));
                          },
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Book an appointment with a doctor now',
                                style: TextStyle(
                                  color: Color(0xFF99C4BC),
                                  fontSize: 12.sp,
                                  fontFamily: 'Kodchasan',
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                        ),
                        Container(
                          width: 375.w,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.w,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFEEEEEE),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 343.w,
                          height: 111.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 28.h,
                                top: 44.h,
                                child: SizedBox(
                                    width: 277.w,
                                    child: Text(
                                      '"Today marks your anemia screening appointment. Please attend at the designated time to ensure your health."',
                                      style: TextStyle(
                                        color: Color(0xFF8A8989),
                                        fontSize: 12.sp,
                                        fontFamily: 'Kodchasan',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                              ),
                              Positioned(
                                left: 0,
                                top: 16.h,
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Icon(
                                          Icons.add_alert_outlined,
                                          color: AppColors.lightPrimaryColor,
                                          size: 25.0.sp,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      SizedBox(
                                        // width: 44,
                                        child: Text(
                                          'Reminder,',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                            fontFamily: 'Kodchasan',
                                            fontWeight: FontWeight.w700,
                                            // height: 0.11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 260.h,
                                top: 16.h,
                                child: SizedBox(
                                  width: 44,
                                  child: Text(
                                    '45 min',
                                    style: TextStyle(
                                      color: Color(0xFF8A8989),
                                      fontSize: 11.sp,
                                      fontFamily: 'Kodchasan',
                                      fontWeight: FontWeight.w700,
                                      height: 0.12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CBCTest()));
                          },
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Take the test now',
                                style: TextStyle(
                                  color: Color(0xFF99C4BC),
                                  fontSize: 12,
                                  fontFamily: 'Kodchasan',
                                  fontWeight: FontWeight.w700,
                                  height: 0.12,
                                ),
                              )),
                        ),
                        Container(
                          width: 375.w,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.w,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFEEEEEE),
                              ),
                            ),
                          ),
                        ),
                      ])
                ])));
  }
}
