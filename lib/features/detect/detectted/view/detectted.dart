import 'package:animeacheck/features/detect/image/byEye/view/Detect_anemia_by_eye.dart';
import 'package:animeacheck/features/detect/image/gallery/data/widget/detect_anemia_by_image.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/appColors/app_colors.dart';
import '../data/widgets/build_action_button.dart';
import '../data/widgets/build_detected_info.dart';
import '../data/widgets/build_header.dart';

class DetectedScreen extends StatelessWidget {
  const DetectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        backgroundColor:BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
        ?AppColors.darkThemBlackColor:AppColors.lightPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeader(context),
              buildDetectedInfo(context),
              buildActionButton(iconData: Icons.camera_alt_rounded, onTap: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetectAnemiaByEye()),
                  )),
              buildActionButton(
                  iconData: Icons.upload_file,
                  onTap: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetectAnemiaByImage()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
