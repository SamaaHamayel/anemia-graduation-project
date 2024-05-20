import 'dart:io';

import 'package:animeacheck/features/detect/detectted/view/detected_result.dart';
import 'package:animeacheck/features/detect/help/help.dart';
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
          flexibleSpace: Image(
            image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : AssetImage('lib/core/utils/appImages/images/background.png'),
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 23,
              color: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AppColors.whiteColor
                  : AppColors.lightPrimaryColor,
            ),
          ),
          title: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                    ? AssetImage(
                        'lib/core/utils/appImages/images/backgroundDark.png')
                    : AssetImage(
                        'lib/core/utils/appImages/images/background.png'),

                fit: BoxFit
                    .cover, // Optional: You can set the image fit as needed
              ),
            ),
            child: Text(AppLocalizations.of(context)!.detectAnemia,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 24,
                    color:
                        BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                            ? AppColors.whiteColor
                            : AppColors.lightPrimaryColor,
                    fontFamily: 'Kodchasan',
                    fontWeight: FontWeight.w700)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.help,
                  color:
                      BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                          ? AppColors.whiteColor
                          : AppColors.lightPrimaryColor,
                  size: 30.sp,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpDetect()),
                  );
                },
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AssetImage(
                      'lib/core/utils/appImages/images/backgroundDark.png')
                  : AssetImage(
                      'lib/core/utils/appImages/images/background.png'),
              fit:
                  BoxFit.cover, // Optional: You can set the image fit as needed
            ),
          ),
          child: Center(
            child: BlocConsumer<DetectAnemiaCubit, DetectAnemiaState>(
              listener: (context, state) {
                if (state is ClassifyImageSuccessState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultScreen(
                          message: BlocProvider.of<DetectAnemiaCubit>(context)
                              .data['message'],
                          // predictedClass:
                          //     BlocProvider.of<DetectAnemiaCubit>(context)
                          //         .data['metadata']['predicted_classes'][0],
                        );
                      },
                    ),
                  );
                  // showToast(
                  //     message: AppLocalizations.of(context)!.success,
                  //     state: ToastStates.success);
                }
              },
              builder: (context, state) {
                final detectAnemiaCubit =
                    BlocProvider.of<DetectAnemiaCubit>(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 350.w,
                      height: 250.h,
                      padding: EdgeInsets.only(top: 40.h),
                      child: state is ClassifyImageLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : detectAnemiaCubit.image == null
                              ? Image.asset(
                                  'lib/core/utils/appImages/images/detectAnemia.png')
                              : Image.file(File(detectAnemiaCubit.image!.path)),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.h, vertical: 30.h),
                      child: Text(
                          AppLocalizations.of(context)!.detectAnemiaTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 20.sp,
                                color: BlocProvider.of<SettingsCubit>(context)
                                        .isDarkThemEnable
                                    ? AppColors.whiteColor
                                    : AppColors.lightPrimaryColor,
                                fontFamily: 'Kodchasan',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 1.76,
                              )),
                    ),

                    //pick image from camera
                    ImagePickerButton(
                      icon: Icons.camera_alt_rounded,
                      onTap: () async {
                        detectAnemiaCubit.image =
                            await pickImage(ImageSource.camera);
                        print(detectAnemiaCubit.image!.path);
                        detectAnemiaCubit
                            .classifyImage(detectAnemiaCubit.image!);
                        // pickImage(ImageSource.gallery).then(
                        //     (value) => detectAnemiaCubit.takeImage(value));
                      },
                    ),

                    //pick image from gallery
                    ImagePickerButton(
                      icon: Icons.image_rounded,
                      onTap: () async {
                        detectAnemiaCubit.image =
                            await pickImage(ImageSource.gallery);
                        print(detectAnemiaCubit.image!.path);
                        detectAnemiaCubit
                            .classifyImage(detectAnemiaCubit.image!);
                        // pickImage(ImageSource.gallery).then(
                        //     (value) => detectAnemiaCubit.takeImage(value));
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
