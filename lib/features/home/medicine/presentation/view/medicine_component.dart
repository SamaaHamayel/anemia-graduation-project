import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/medicine/domain/medicine_model/medicine_model.dart';
import 'package:animeacheck/features/home/medicine/medicine_cubit/medicine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Component extends StatelessWidget {
  const Component({super.key, required this.medicineModel});

  final MedicineModel medicineModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 10),
      child: Container(
        height: 178.h,
        width: 164.w,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grayColor),
            borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 8.h,
            ),
            CircleAvatar(
              child: BlocProvider.of<MedicineCubit>(context).getImage(
                medicineModel.medicineShape,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              medicineModel.medicineName,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text('${medicineModel.medicineDose}'),
            Text(medicineModel.startTime),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_rounded,
                    color: AppColors.redColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_calendar_rounded,
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
