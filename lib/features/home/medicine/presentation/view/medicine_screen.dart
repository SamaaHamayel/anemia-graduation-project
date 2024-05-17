import 'package:animeacheck/features/home/medicine/medicine_cubit/medicine_cubit.dart';
import 'package:animeacheck/features/home/medicine/medicine_cubit/medicine_state.dart';
import 'package:animeacheck/features/home/medicine/presentation/view/medicine_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../conf/routes/routes.dart';
import '../../../../../core/utils/appColors/app_colors.dart';
import '../../../../../core/utils/common.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../medicine_widgets/no_medicine_widget.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            navigateReplacement(context: context, route: Routes.home);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: AppColors.primaryColor,
          ),
        ),
        flexibleSpace: const Image(
          image: AssetImage('lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        title: Text(
          AppLocalizations.of(context)!.medicineReminder,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "lib/core/utils/appImages/images/background.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          SizedBox(
            height: 30.h,
          ),
          BlocConsumer<MedicineCubit, MedicineState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return BlocProvider.of<MedicineCubit>(context)
                      .medicineList
                      .isEmpty
                  ? NoMedicineWidgets()
                  :  MedicineComponent(
                          medicineModel: BlocProvider.of<MedicineCubit>(context)
                              .medicineList[0],
                        );
                      },


          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: AppColors.lightPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Form(
                key: BlocProvider.of<MedicineCubit>(context).addMedicineKey,
                child: SingleChildScrollView(
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
                              message: 'Added Successfully',
                              state: ToastStates.success);
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 18),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .addNewMedicine,
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
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 18),
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
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller:
                                    BlocProvider.of<MedicineCubit>(context)
                                        .medicineNameController,
                                decoration: InputDecoration(
                                  border: const UnderlineInputBorder(),
                                  hintText: AppLocalizations.of(context)!
                                      .medicineName,
                                  hintStyle: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.grayColor),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                controller:
                                    BlocProvider.of<MedicineCubit>(context)
                                        .medicineDoseController,
                                decoration: InputDecoration(
                                  border: const UnderlineInputBorder(),
                                  hintText: AppLocalizations.of(context)!
                                      .medicineDose,
                                  hintStyle: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.grayColor),
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
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: 50.w,
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
                                                  BlocProvider.of<
                                                              MedicineCubit>(
                                                          context)
                                                      .currentIndex
                                              ? Stack(
                                                  children: [
                                                    BlocProvider.of<
                                                                MedicineCubit>(
                                                            context)
                                                        .getImage(index),
                                                    const Icon(
                                                      Icons.check,
                                                      color:
                                                          AppColors.blackColor,
                                                    )
                                                  ],
                                                )
                                              : BlocProvider.of<MedicineCubit>(
                                                      context)
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
                                      BlocProvider.of<MedicineCubit>(context)
                                          .getStartTime(context);
                                      (GetStartTimeSuccessState);
                                      BlocProvider.of<MedicineCubit>(context)
                                          .insertMedicine();
                                      (InsertMedicineSuccessState());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.primaryColor),
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
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, size: 35, color: AppColors.whiteColor),
      ),
    );
  }
}
