import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/appColors/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../history_widgets/test_history_card.dart';



class History extends StatelessWidget {
  const History({super.key});



  @override
  Widget build(BuildContext context) {
    String datetime = DateFormat("dd-MM-yyyy").format(DateTime.now());
    return Scaffold(
      body: Stack(
          children:[
            Image.asset(
    BlocProvider.of<SettingsCubit>(context).isDarkThemEnable ? 
                 (
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : ('lib/core/utils/appImages/images/background.png'),
                           fit: BoxFit.cover,
              width: double.infinity,
            ),
            Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Text(AppLocalizations.of(context)!.testResultHistory,
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 24,
                          color: AppColors.primaryColor,
                          fontFamily: 'Kodchasan',
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 40.h,
                ),

                //this(its logic for image and text) will come from api or ai
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: [
                      TestHistoryCard(datetime: datetime),
                      SizedBox(
                        height: 15.h,
                      ),
                      TestHistoryCard(datetime: datetime),
                      SizedBox(
                        height: 15.h,
                      ),
                      TestHistoryCard(datetime: datetime),

                    ],
                  ),
                ),

              ],
            ),
          ]
      ),
    );
  }
}