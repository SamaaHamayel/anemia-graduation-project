import 'package:animeacheck/core/utils/appColors/app_colors.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildSnackBar(BuildContext context) {
  // Pass context as a parameter
  return Scaffold(
    backgroundColor: Colors.transparent,
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
 image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ?const AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                :const AssetImage('lib/core/utils/appImages/images/background.png'),          fit: BoxFit.cover, // Optional: You can set the image fit as needed
        ),
      ),
      child: Center(
        child: Container(
          width: 324,
          height: 308,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 71,
                top: 91,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'We can’t reach \nyour eyelid',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Kodchasan',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 32),
                    GestureDetector(
                      onTap: () {
                        // Add your onPressed logic here
                        print('Try Again button pressed');
                      },
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Now context is available
                        },
                        child: const Text(
                          'Try Again',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFEA4335),
                            fontSize: 24,
                            fontFamily: 'Kodchasan',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: TextButton(
                  onPressed: () {
                    Navigator.popUntil(
                      context, // Now context is available
                      ModalRoute.withName('/DetectAnemiaByEye'),
                    );
                  },
                  child: const Text(
                    ' x ',
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.lightPrimaryColor,
                      // Add your text style properties here
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
