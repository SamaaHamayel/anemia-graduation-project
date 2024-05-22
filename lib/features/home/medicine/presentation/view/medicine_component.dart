import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/medicine/domain/medicine_model/medicine_model.dart';
import 'package:animeacheck/features/home/medicine/medicine_cubit/medicine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Component extends StatelessWidget {
    const Component(this.index,{super.key, required this.medicineModel});

  final MedicineModel medicineModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 10),
      child: Stack(
        children: [
          Container(
          height: 178.h,
          width: 164.w,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1.5.w,
                  color: AppColors.greenColor
              ),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
                bottomRight: index.isEven ? const Radius.circular(25) : Radius.zero,
                bottomLeft: index.isOdd ? const Radius.circular(25) : Radius.zero,

              )
          ),
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
                style: const TextStyle(
                  color: AppColors.greenColor
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text('${medicineModel.medicineDose}'),
              Text(medicineModel.startTime,
                style: const TextStyle(
                    color: AppColors.greenColor
                ),
              ),

            ],
          ),

        ),
          Positioned(
            right: index.isOdd ? -5 : 100 ,
            left: index.isEven ? -5 : 100,
            bottom: 2,
            child: IconButton(
              onPressed: () {
                BlocProvider.of<MedicineCubit>(context).deleteMedicine(medicineModel.id);
              },
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: AppColors.redColor,
              ),
            ),
          ),
        ]
      ),
    );
  }
}
