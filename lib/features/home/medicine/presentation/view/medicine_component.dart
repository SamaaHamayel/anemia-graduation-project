import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/core/utils/appString/app_strings.dart';
import 'package:animeacheck/core/utils/common.dart';
import 'package:animeacheck/features/home/medicine/domain/medicine_model/medicine_model.dart';
import 'package:animeacheck/features/home/medicine/medicine_cubit/medicine_cubit.dart';
import 'package:animeacheck/features/home/medicine/medicine_cubit/medicine_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineComponent extends StatelessWidget {
  const MedicineComponent({super.key, required this.medicineModel
  });

  final MedicineModel medicineModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<MedicineCubit, MedicineState>(
        listener: (context, state) {
          if (state is AddMedicineSuccessState){
            showToast(
                message: AppStrings.success,
                state: ToastStates.success);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Image.asset(AppAssets.background,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
                  GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 16,),
                    children: [
                      Padding(
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
                                height: 10.h,
                              ),

                              CircleAvatar(
                                child: BlocProvider.of<MedicineCubit>(context)
                                    .getImage(BlocProvider.of<MedicineCubit>(context)
                                    .currentIndex,),
                              ),

                              SizedBox(
                                height: 15.h,
                              ),
                              Text(BlocProvider.of<MedicineCubit>(context)
                                  .medicineNameController
                                  .text),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(BlocProvider.of<MedicineCubit>(context)
                                  .medicineDoseController
                                  .text),
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
                      ),
                    ]
                  ),
                ],
          );


        },
      ),
    );
  }
}
