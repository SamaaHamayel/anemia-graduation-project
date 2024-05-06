import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class noMedicineScreen extends StatelessWidget {
  const noMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('lib/core/utils/appImages/images/background.png'),
              fit:
                  BoxFit.cover, // Optional: You can set the image fit as needed
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
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
                            SizedBox(width: 25.w),
                            Text(
                              AppLocalizations.of(context)!.medicineReminder,
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
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Image.asset(
                            AppAssets.noMedicine,
                            scale: 0.5,
                          ),
                        ),
                        Container(
                          width: 351,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 56),
                              SizedBox(
                                width: 351.w,
                                child: Text(
                                  AppLocalizations.of(context)!.noMedicine,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 20.sp,
                                    fontFamily: 'Kodchasan',
                                    fontWeight: FontWeight.w600,
                                    height: 0.07.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 64.w,
                                    height: 64.h,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: AppColors.lightPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: AppColors.whiteColor,
                                        size: 30.sp,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                ]),
          ),
        ));
  }
}
// IconButton(
//                                               icon: Icon(
                                            //     Icons.add,
                                            //     color: AppColors
                                            //         .lightPrimaryColor,
                                            //     size: 23.sp,
                                            //   ),
                                            //   onPressed: () {
                                            //     Navigator.pop(context);
                                            //   },
                                            // ),