import 'package:animeacheck/features/home/home_widgets/custom_file_image.dart';
import 'package:animeacheck/features/home/pri_home/presentation/detect_anemia_cubit/detect_anemia_cubit.dart';
import 'package:animeacheck/features/home/pri_home/presentation/detect_anemia_cubit/detect_anemia_state.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/appColors/app_colors.dart';
import '../../../../core/utils/common.dart';
import '../../../home/home_widgets/image_picker_button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetectedScreen extends StatelessWidget {
  const DetectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        backgroundColor:
            BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AppColors.darkThemBlackColor
                : AppColors.lightPrimaryColor,
        appBar: AppBar(
          backgroundColor:
              BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AppColors.darkThemBlackColor
                  : AppColors.lightPrimaryColor,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 23,
              color: AppColors.whiteColor,
            ),
          ),
          title: Text(AppLocalizations.of(context)!.detectAnemia,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 24,
                  color: AppColors.whiteColor,
                  fontFamily: 'Kodchasan',
                  fontWeight: FontWeight.w700)),
        ),
        body: Center(
          child: BlocConsumer<DetectAnemiaCubit, DetectAnemiaState>(
            listener: (context, state) {
              if (state is DetectAnemiaSuccessState) {
                showToast(
                    message: AppLocalizations.of(context)!.success,
                    state: ToastStates.success);
              }
            },
            builder: (context, state) {
              final detectAnemiaCubit=BlocProvider.of<DetectAnemiaCubit>(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding:  EdgeInsets.only(top: 75.h),
                    child: CustomFileImage(
                      image: detectAnemiaCubit.image,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Text(AppLocalizations.of(context)!.detectAnemiaTitle,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 18,
                                  color: AppColors.whiteColor,
                                  fontFamily: 'Kodchasan',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: 1.76,
                                )),
                  ),

                  //pick image from camera
                  ImagePickerButton(
                    icon: Icons.camera_alt_rounded,
                    onTap: () {
                      pickImage(ImageSource.camera).
                      then((value) => detectAnemiaCubit.takeImage(value)
                      );
                    },
                  ),

                  //pick image from gallery
                  ImagePickerButton(
                    icon: Icons.image_rounded,
                    onTap: () {
                      pickImage(ImageSource.gallery).
                      then((value) => detectAnemiaCubit.takeImage(value));
                    },
                  ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
