import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/core/utils/appImages/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/setting/presentation/settings_cubit/settings_cubit.dart';
import '../../gallery/data/widget/detect_anemia_by_image.dart';
import '../data/widget/build_icon_button.dart';
import '../data/widget/take_packer.dart';

class DetectAnemiaByEye extends StatefulWidget {
  const DetectAnemiaByEye({Key? key});

  @override
  State<DetectAnemiaByEye> createState() => DetectAnemiaByEyeState();
}

class DetectAnemiaByEyeState extends State<DetectAnemiaByEye> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlackColor,
      appBar: AppBar(
        backgroundColor:   BlocProvider.of<SettingsCubit>(context).isDarkThemEnable? AppColors.darkThemBlackColor : AppColors.lightBackgroundColor,

        leading: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
 image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ?const AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                :const AssetImage('lib/core/utils/appImages/images/background.png'),
              fit:
                  BoxFit.cover, // Optional: You can set the image fit as needed
            ),
          ),
          child: IconButton(
            icon:  Icon(
              Icons.arrow_back_ios,
        color:  BlocProvider.of<SettingsCubit>(context).isDarkThemEnable? AppColors.whiteColor : AppColors.whiteColor,
              size: 25.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 208),
                child: Container(
                  color: AppColors.lightGrayColor,
                  child: Center(
                    child: Image.asset(
                      'lib/core/utils/appImages/images/detect.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 110,
                //color: AppColors.lightPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildIconButton(
                        icon: Icons.image,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetectAnemiaByImage(),
                            ),
                          );
                        },
                      ),
                      buildIconButton(
                        icon: Icons.circle_outlined,
                        onPressed: () {
                          takePicture(context);
                          // Handle circle button press
                        },
                      ),
                      buildIconButton(
                        icon: Icons.refresh_sharp,
                        onPressed: () {
                          setState(() {});
                          // Handle refresh button press
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
