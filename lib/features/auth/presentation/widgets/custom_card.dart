import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/appColors/app_colors.dart';
import '../../../home/setting/presentation/settings_cubit/settings_cubit.dart';
import '../person_info_cubit/personal_info_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.personalInfoCubit,
  });

  final PersonalInfoCubit personalInfoCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      width: 343.w,
      height: 320.h,
      child: Card(
        color:  BlocProvider.of<SettingsCubit>(context).isDarkThemEnable? AppColors.darkThemBlackColor : AppColors.whiteColor,
        child: Column(
          children: [
            Container(
              height: 40.h,
              width: 343.w,
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
                  AppLocalizations.of(context)!.chooseYourCategory,
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
                  value: AppLocalizations.of(context)!.infants,
                  groupValue: personalInfoCubit.groupValue,
                  onChanged: (value) {
                    personalInfoCubit.changeGroupValue(value);
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.infants,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Radio(
                  activeColor: AppColors.primaryColor,
                  value: AppLocalizations.of(context)!.youngChildren,
                  groupValue: personalInfoCubit.groupValue,
                  onChanged: (value) {
                    personalInfoCubit.changeGroupValue(value);
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.youngChildren,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Radio(
                  activeColor: AppColors.primaryColor,
                  value: AppLocalizations.of(context)!.adultMales,
                  groupValue: personalInfoCubit.groupValue,
                  onChanged: (value) {
                    personalInfoCubit.changeGroupValue(value);
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.adultMales,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Radio(
                  activeColor: AppColors.primaryColor,
                  value: AppLocalizations.of(context)!.adultFemalesPregnant,
                  groupValue: personalInfoCubit.groupValue,
                  onChanged: (value) {
                    personalInfoCubit.changeGroupValue(value);
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.adultFemalesPregnant,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Radio(
                  activeColor: AppColors.primaryColor,
                  value: AppLocalizations.of(context)!.adultFemalesNotPregnant,
                  groupValue: personalInfoCubit.groupValue,
                  onChanged: (value) {
                    personalInfoCubit.changeGroupValue(value);
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.adultFemalesNotPregnant,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        //color: AppColors.primaryColor,
      ),
    );
  }
}
