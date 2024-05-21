import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:animeacheck/core/utils/appColors/app_colors.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorScreen({Key? key, required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        backgroundColor:
            BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AppColors.darkThemBlackColor
                : AppColors.lightPrimaryColor,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                  ? AssetImage(
                      'lib/core/utils/appImages/images/backgroundDark.png')
                  : AssetImage(
                      'lib/core/utils/appImages/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 200,
                  color:
                      BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                          ? AppColors.whiteColor
                          : AppColors.darkThemBlackColor,
                ),
                SizedBox(height: 20),
                Text(
                  'Failed to load, please check your\ninternet connection before proceeding',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                            ? AppColors.whiteColor
                            : AppColors.darkThemBlackColor,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                            ? AppColors.lightPrimaryColor
                            : AppColors.darkThemBlackColor,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  child: Text(
                    'Try Again',
                    style: TextStyle(
                      color: BlocProvider.of<SettingsCubit>(context)
                              .isDarkThemEnable
                          ? AppColors.darkThemBlackColor
                          : AppColors.whiteColor,
                      fontSize: 16,
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
}
