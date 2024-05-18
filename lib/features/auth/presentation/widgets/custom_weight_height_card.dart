import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/appColors/app_colors.dart';
import '../person_info_cubit/personal_info_cubit.dart';



class WeightAndHeightCustomCard extends StatelessWidget {
  const WeightAndHeightCustomCard({
    super.key,
    required this.text,
    required this.textFieldHintText,
    required this.keyBoardType,
  });


  final String text;
  final String textFieldHintText;
  final TextInputType keyBoardType;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118.h,
      width: 343.w,
      child: Card(
                color:  BlocProvider.of<SettingsCubit>(context).isDarkThemEnable? AppColors.darkThemBlackColor : AppColors.whiteColor,

        child: Column(
          children: [
            Container(
              height: 52.h,
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
                  text,
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
            SizedBox(
              height: 45.h,
              width: 434.w,
              child:  TextFormField(
                keyboardType: keyBoardType,
                controller: BlocProvider.of<PersonalInfoCubit>(context)
                    .weightController,
                decoration:  InputDecoration(
                  hintText: textFieldHintText,
                  hintStyle: const TextStyle(
                      fontSize: 13,
                      fontFamily: "Kodchasan",
                      fontWeight: FontWeight.w700,
                      color: AppColors.grayColor
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.whiteColor
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
