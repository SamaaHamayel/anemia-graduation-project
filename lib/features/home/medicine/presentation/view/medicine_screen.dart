import 'package:animeacheck/core/services/notification.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:animeacheck/features/home/medicine/domain/medicine_model/medicine_model.dart';
import 'package:animeacheck/features/home/medicine/medicine_cubit/medicine_cubit.dart';
import 'package:animeacheck/features/home/medicine/medicine_cubit/medicine_state.dart';
import 'package:animeacheck/features/home/medicine/presentation/medicine_widgets/add_medicine_button_sheet.dart';
import 'package:animeacheck/features/home/medicine/presentation/view/medicine_component.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../conf/routes/routes.dart';
import '../../../../../core/utils/appColors/app_colors.dart';
import '../../../../../core/utils/common.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../medicine_widgets/no_medicine_widget.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  void initState() {
    BlocProvider.of<MedicineCubit>(context).getMedicine();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
              ? const AssetImage(
                  'lib/core/utils/appImages/images/backgroundDark.png')
              : const AssetImage(
                  'lib/core/utils/appImages/images/background.png'),
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            NotificationService().scheduleNotification(
              medicineModel: MedicineModel(
                  medicineName: "tt", medicineDose: 2, startTime: "26/8"),
              scheduledNotificationDateTime: DateTime.now().add(Duration(seconds: 10)),
            );

            // navigateReplacement(context: context, route: Routes.home);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AppColors.whiteColor
                : AppColors.lightPrimaryColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.medicineReminder,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24,
              color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AppColors.whiteColor
                  : AppColors.lightPrimaryColor,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? (AppAssets.backgroundDark)
                : (AppAssets.background),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          BlocConsumer<MedicineCubit, MedicineState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Stack(
                children: [
                  Image.asset(
                    BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                        ? (AppAssets.backgroundDark)
                        : (AppAssets.background),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocProvider.of<MedicineCubit>(context)
                              .medicineList
                              .isEmpty
                          ? const NoMedicineWidgets()
                          : Expanded(
                              child: GridView.builder(
                                itemCount:
                                    BlocProvider.of<MedicineCubit>(context)
                                        .medicineList
                                        .length,
                                itemBuilder: (context, index) {
                                  return Component(
                                    index,
                                    medicineModel:
                                        BlocProvider.of<MedicineCubit>(context)
                                            .medicineList[index],
                                  );
                                },
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 16,
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor:
            BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AppColors.lightBackgroundColor
                : AppColors.lightPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return BlocBuilder<MedicineCubit, MedicineState>(
                builder: (context, state) {
                  return AddMedicineButtonSheet(
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () async {
                        BlocProvider.of<MedicineCubit>(context)
                            .getStartTime(context);
                      },
                      icon: const Icon(
                        Icons.timer_outlined,
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                    hintText: BlocProvider.of<MedicineCubit>(context).startTime,
                  );
                },
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 35,
          color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
              ? AppColors.lightPrimaryColor
              : AppColors.whiteColor,
        ),
      ),
    );
  }

  DateTime futureTime = DateTime.now().add(Duration(seconds: 10));

  Future<DateTime> getTwoMinutesAhead() => Future.delayed(
        Duration(seconds: 10),
        () => DateTime.now().add(
          Duration(seconds: 10),
        ),
      );
}

// import 'package:animeacheck/features/home/medicine/presentation/view/medicine_component.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../conf/routes/routes.dart';
// import '../../../../../core/utils/appColors/app_colors.dart';
// import '../../../../../core/utils/appImages/app_assets.dart';
// import '../../../../../core/utils/common.dart';
// import '../../../setting/presentation/settings_cubit/settings_cubit.dart';
// import '../../medicine_cubit/medicine_cubit.dart';
// import '../../medicine_cubit/medicine_state.dart';
// import '../medicine_widgets/add_medicine_button_sheet.dart';
// import '../medicine_widgets/no_medicine_widget.dart';
//
//  import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
//
// class MedicineScreen extends StatefulWidget {
//   const MedicineScreen({super.key});
//
//   @override
//   State<MedicineScreen> createState() => _MedicineScreenState();
// }
//
// class _MedicineScreenState extends State<MedicineScreen> {
//   @override
//   void initState() {
//     BlocProvider.of<MedicineCubit>(context).getMedicine();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Image(
//           image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
//               ? const AssetImage(
//               'lib/core/utils/appImages/images/backgroundDark.png')
//               : const AssetImage(
//               'lib/core/utils/appImages/images/background.png'),
//           fit: BoxFit.cover,
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             navigateReplacement(context: context, route: Routes.home);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 24,
//             color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
//                 ? AppColors.whiteColor
//                 : AppColors.lightPrimaryColor,
//           ),
//         ),
//         title: Text(
//           AppLocalizations.of(context)!.medicineReminder,
//           style: Theme.of(context).textTheme.displaySmall!.copyWith(
//               fontSize: 24,
//               color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
//                   ? AppColors.whiteColor
//                   : AppColors.lightPrimaryColor,
//               fontFamily: 'Kodchasan',
//               fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: BlocConsumer<MedicineCubit, MedicineState>(
//         listener: (context, state) {
//           if (state is GetMedicineSuccessState) {
//             // البيانات تم جلبها بنجاح
//           } else if (state is GetMedicineErrorState) {
//             // التعامل مع خطأ الجلب
//             print('Error fetching medicine data');
//           }
//         },
//         builder: (context, state) {
//           if (state is GetMedicineLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is GetMedicineErrorState) {
//             return const Center(child: Text('Error loading medicine data'));
//           }
//           return Stack(
//             children: [
//               Image.asset(
//                 BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
//                     ? (AppAssets.backgroundDark)
//                     : (AppAssets.background),
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//               Column(
//                 children: [
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   BlocProvider.of<MedicineCubit>(context).medicineList.isEmpty
//                       ? const NoMedicineWidgets()
//                       : Expanded(
//                     child: GridView.builder(
//                       itemBuilder: (context, index) {
//                         return Component(
//                             medicineModel: BlocProvider.of<MedicineCubit>(
//                                 context)
//                                 .medicineList[index]);
//                       },
//                       gridDelegate:
//                       const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(100),
//         ),
//         backgroundColor:
//         BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
//             ? AppColors.lightBackgroundColor
//             : AppColors.lightPrimaryColor,
//         onPressed: () {
//           showModalBottomSheet(
//             isScrollControlled: true,
//             context: context,
//             builder: (context) {
//               return BlocBuilder<MedicineCubit, MedicineState>(
//                 builder: (context, state) {
//                   return AddMedicineButtonSheet(
//                     readOnly: true,
//                     suffixIcon: IconButton(
//                       onPressed: () async {
//                         BlocProvider.of<MedicineCubit>(context)
//                             .getStartTime(context);
//                       },
//                       icon: const Icon(
//                         Icons.timer_outlined,
//                         color: AppColors.lightPrimaryColor,
//                       ),
//                     ),
//                     hintText: BlocProvider.of<MedicineCubit>(context).startTime,
//                   );
//                 },
//               );
//             },
//           );
//         },
//         child: Icon(
//           Icons.add,
//           size: 35,
//           color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
//               ? AppColors.lightPrimaryColor
//               : AppColors.whiteColor,
//         ),
//       ),
//     );
//   }
// }
