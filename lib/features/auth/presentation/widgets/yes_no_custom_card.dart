import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/appString/app_strings.dart';
import '../person_info_cubit/personal_info_cubit.dart';

class YesNoCustomCard extends StatelessWidget {
  const YesNoCustomCard({
    super.key,
    required this.personalInfoCubit,
    required this.cardTitle,
  });

  final PersonalInfoCubit personalInfoCubit;

  final String cardTitle;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 118.h,
      child: Card(
        color: AppColors.whiteColor,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 332.w,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFF2BB598), Color(0xFF398272)],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  )),
              child: Padding(
                padding: EdgeInsets.only(top: 9.h, left: 16.w),
                child: Text(
                  cardTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: AppColors.whiteColor,
                      fontFamily: "Kodchasan",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Row(
              children: [
                Radio(
                  activeColor: AppColors.primaryColor,
                  value: AppStrings.yes,
                  groupValue: personalInfoCubit.yesNoGroupValue,
                  onChanged: (value) {
                    personalInfoCubit.changePeriodGroupValue(value);
                  },
                ),
                Text(
                  AppStrings.yes,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Radio(
                        activeColor: AppColors.primaryColor,
                        value: AppStrings.no,
                        groupValue: personalInfoCubit.yesNoGroupValue,
                        onChanged: (value) {
                          personalInfoCubit.changePeriodGroupValue(value);
                        },
                      ),
                      Text(
                        AppStrings.no,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 15),
                      ),

                    ],
                  ),
                )

              ],
            ),






          ],
        ),
        //color: AppColors.primaryColor,
      ),
    );
  }
}
