import 'package:animeacheck/features/auth/presentation/person_info_cubit/personal_info_state.dart';
import 'package:animeacheck/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../conf/routes/routes.dart';
import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/common.dart';
import '../person_info_cubit/personal_info_cubit.dart';
import '../widgets/custom_card.dart';
import '../widgets/yes_no_custom_card.dart';
import '../widgets/custom_weight_height_card.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class InfoOneScreen extends StatelessWidget {
  const InfoOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            navigateReplacement(context: context, route: Routes.signUp);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: AppColors.primaryColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.personalInformation,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24,
              color: AppColors.lightPrimaryColor,
              fontFamily: 'Kodchasan',
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
          listener: (context, state) {
            if (state is PersonalInfoSuccessState) {
              navigateReplacement(context: context, route: Routes.infoTwo);
            }
          },
          builder: (context, state) {
            final personalInfoCubit =
                BlocProvider.of<PersonalInfoCubit>(context);
            return Center(
              child: Form(
                key: personalInfoCubit.personalInfoKey,
                child: Column(
                  children: [
                    CustomCard(personalInfoCubit: personalInfoCubit),
                     WeightAndHeightCustomCard(
                      text: AppLocalizations.of(context)!.weight,
                      keyBoardType: TextInputType.number,
                      textFieldHintText: AppLocalizations.of(context)!.enterYourWeight,
                    ),
                     WeightAndHeightCustomCard(
                        text: AppLocalizations.of(context)!.height,
                        keyBoardType: TextInputType.number,
                        textFieldHintText: AppLocalizations.of(context)!.enterYourHeight),
                    YesNoCustomCard(
                      personalInfoCubit: personalInfoCubit,
                      cardTitle: AppLocalizations.of(context)!.areYouOnYourPeriod,
                    ),

                    SizedBox(
                      height: 24.h,
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 172.w,
                        height: 55.h,
                        child:
                        state is PersonalInfoLoadingState?
                          const Center(
                              child: CircularProgressIndicator())
                            :CustomElevatedButton(
                            text: AppLocalizations.of(context)!.next,
                            onPressed: () async{
                              if (BlocProvider.of<PersonalInfoCubit>(context)
                                  .personalInfoKey
                                  .currentState!
                                  .validate()) {
                                await sl<CacheHelper>().saveData(
                              key: AppLocalizations.of(context)!.personalInfoKey,
                              value: true).then((value) {
                              navigateReplacement(context: context,
                              route: Routes.infoTwo);
                              });
                            }

                            }
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
