// import 'package:animeacheck/conf/routes/routes.dart';
// import 'package:animeacheck/core/utils/appColors/app_colors.dart';
// import 'package:animeacheck/core/utils/appImages/app_assets.dart';
// import 'package:animeacheck/core/utils/common.dart';
// import 'package:animeacheck/features/home/history/data/history_model.dart';
// import 'package:animeacheck/features/home/history/history_widgets/history_cubit.dart';
// import 'package:animeacheck/features/home/history/history_widgets/history_state.dart';
// import 'package:animeacheck/features/home/history/history_widgets/no_history_widget.dart';
// import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// class HistoryScreen extends StatefulWidget {
//   const HistoryScreen({super.key});
//
//   @override
//   State<HistoryScreen> createState() => _HistoryScreenState();
// }
//
// class _HistoryScreenState extends State<HistoryScreen> {
//   @override
//   void initState() {
//     BlocProvider.of<HistoryCubit>(context).getHistory();
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
//                   'lib/core/utils/appImages/images/backgroundDark.png')
//               : const AssetImage(
//                   'lib/core/utils/appImages/images/background.png'),
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
//           AppLocalizations.of(context)!.testResultHistory,
//           style: Theme.of(context).textTheme.displaySmall!.copyWith(
//               fontSize: 24,
//               color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
//                   ? AppColors.whiteColor
//                   : AppColors.lightPrimaryColor,
//               fontFamily: 'Kodchasan',
//               fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: BlocConsumer<HistoryCubit, HistoryState>(
//         listener: (context, state) {},
//         builder: (context, state) {
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
//                   BlocProvider.of<HistoryCubit>(context).historyList.isEmpty
//                       ? const NoHistoryWidget()
//                       : Expanded(
//                           child: ListView.builder(
//                             itemCount: BlocProvider.of<HistoryCubit>(context)
//                                 .historyList
//                                 .length,
//                             itemBuilder: (context, index) {
//                               final history =
//                                   BlocProvider.of<HistoryCubit>(context)
//                                       .historyList[index];
//                               return Card(
//                                 child: Column(
//                                   children: [
//                                     Text(history.date),
//
//                                     // HistoryModel(date: '',
//                                     //   result: BlocProvider.of<DetectAnemiaCubit>(context)
//                                     //     .data['message'],),
//
//                                    // Image.memory(bytes),
//
//
//
//
//                                     IconButton(
//                                       icon: Icon(Icons.delete),
//                                       onPressed: () {
//                                         BlocProvider.of<HistoryCubit>(context)
//                                             .deleteHistory(history.id!);
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

//______________________________________________

import 'package:animeacheck/features/home/history/history_widgets/no_history_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../conf/routes/routes.dart';
import '../../../../../core/utils/appColors/app_colors.dart';
import '../../../../../core/utils/appImages/app_assets.dart';
import '../../../../../core/utils/common.dart';
import '../../../setting/presentation/settings_cubit/settings_cubit.dart';
import '../../history_widgets/history_cubit.dart';
import '../../history_widgets/history_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    BlocProvider.of<HistoryCubit>(context).getHistory();
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
            navigateReplacement(context: context, route: Routes.home);
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
          AppLocalizations.of(context)!.testResultHistory,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24,
              color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AppColors.whiteColor
                  : AppColors.lightPrimaryColor,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) {
          if (state is GetHistorySuccessState) {
            // البيانات تم جلبها بنجاح
          } else if (state is GetHistoryErrorState) {
            // التعامل مع خطأ الجلب
            print('Error fetching history data');
          } else if (state is InsertHistorySuccessState) {
            BlocProvider.of<HistoryCubit>(context).getHistory();
          }
        },
        builder: (context, state) {
          if (state is GetHistoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetHistoryErrorState) {
            return const Center(child: Text('Error loading history data'));
          }
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
                  BlocProvider.of<HistoryCubit>(context).historyList.isEmpty
                      ? const NoHistoryWidget()
                      : Expanded(
                          child: ListView.builder(
                            itemCount: BlocProvider.of<HistoryCubit>(context)
                                .historyList
                                .length,
                            itemBuilder: (context, index) {
                              final history =
                                  BlocProvider.of<HistoryCubit>(context)
                                      .historyList[index];
                              return Card(
                                child: Column(
                                  children: [
                                // FormData formData = FormData.fromMap({
                                // "image":
                                // await MultipartFile.fromFile(imageFile.path, filename: fileName),
                                // }),
                                //
                                    // assuming image is a Uint8List
                                    Text(history.date),

                                    // BlocProvider.of<DetectAnemiaCubit>(context)
                                    //     .data['message'],

                                    Text(history.result),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        BlocProvider.of<HistoryCubit>(context)
                                            .deleteHistory(history.id);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
