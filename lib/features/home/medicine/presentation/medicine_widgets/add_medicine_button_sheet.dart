import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/common.dart';
import '../../medicine_cubit/medicine_cubit.dart';
import '../../medicine_cubit/medicine_state.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddMedicineButtonSheet extends StatelessWidget {
  const AddMedicineButtonSheet({
    super.key,
    this.suffixIcon,
    required this.readOnly,
    this.validator,  this.title, required this.hintText, this.controller,
  });

  final IconButton? suffixIcon;
  final bool readOnly;
  final String? Function(String?)? validator;
  final Text? title;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 539.h,
        width: 375.w,
        decoration: BoxDecoration(
            color: AppColors.lightBackgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.r),
              topLeft: Radius.circular(24.r),
            )),
        child: BlocConsumer<MedicineCubit, MedicineState>(
          listener: (context, state) {
            if (state is InsertMedicineSuccessState) {
              showToast(
                  message: 'Added Successfully', state: ToastStates.success);
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<MedicineCubit>(context).addMedicineKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 18),
                        child: Text(
                          AppLocalizations.of(context)!.addNewMedicine,
                          style: TextStyle(
                            color: AppColors.lightPrimaryColor,
                            fontSize: 24.sp,
                            fontFamily: 'Kodchasan',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 18),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "X",
                              style: TextStyle(
                                  color: AppColors.lightPrimaryColor,
                                  fontSize: 20.sp),
                            )),
                      )
                    ],
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: BlocProvider.of<MedicineCubit>(context)
                                .medicineNameController,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              hintText: AppLocalizations.of(context)!.medicineName,
                              hintStyle: TextStyle(
                                  fontSize: 20.sp, color: AppColors.grayColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            controller: BlocProvider.of<MedicineCubit>(context)
                                .medicineDoseController,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              hintText: AppLocalizations.of(context)!.medicineDose,
                              hintStyle: TextStyle(
                                  fontSize: 20.sp, color: AppColors.grayColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            readOnly: readOnly,
                            controller: controller,
                            validator: validator,
                            decoration: InputDecoration(
                              //hint
                              hintText: hintText,
                              suffixIcon: suffixIcon,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, left: 28),
                          child: Text(
                            AppLocalizations.of(context)!.medicineShape,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grayColor),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h, left: 28),
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: 40.w,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                BlocProvider.of<MedicineCubit>(context)
                                    .getImage(index);

                                return InkWell(
                                  onTap: () {
                                    BlocProvider.of<MedicineCubit>(context)
                                        .changeCheckMarkIndex(index);
                                    (ChangeCheckMarkIndexState());
                                  },
                                  child: Container(
                                      width: 48.w,
                                      height: 48.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(38.r)),
                                      child: index ==
                                          BlocProvider.of<MedicineCubit>(
                                              context)
                                              .currentIndex
                                          ? Stack(
                                        children: [
                                          BlocProvider.of<MedicineCubit>(
                                              context)
                                              .getImage(index),
                                          const Icon(
                                            Icons.check,
                                            color: AppColors.blackColor,
                                          )
                                        ],
                                      )
                                          : BlocProvider.of<MedicineCubit>(context)
                                          .getImage(index)),
                                );
                              },
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            SizedBox(
                              width: 100.w,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {

                                  if (BlocProvider.of<MedicineCubit>(context)
                                      .addMedicineKey
                                      .currentState!
                                      .validate()) {
                                    BlocProvider.of<MedicineCubit>(context)
                                        .insertMedicine();
                                  }
                                  // BlocProvider.of<MedicineCubit>(context)
                                  //     .getStartTime(context);
                                  // (GetStartTimeSuccessState);
                                  // BlocProvider.of<MedicineCubit>(context)
                                  //     .insertMedicine();
                                  // (InsertMedicineSuccessState());
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor),
                                child: Text(
                                  AppLocalizations.of(context)!.addMedicine,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 20.sp,
                                    fontFamily: 'Kodchasan',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),


                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // void chooseDateTime(context) async {
  //   DateTime? chooseDate = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime.now(),
  //       lastDate: DateTime.now().add(const Duration(days: 365)));
  //
  //   if (chooseDate != null) {
  //     selectedDate = chooseDate;
  //     //setState(() {});
  //   }
  // }
  //
}
