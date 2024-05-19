import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class results extends StatelessWidget {
  const results({super.key});

  @override
  Widget build(BuildContext context) {
 return Container(  decoration: BoxDecoration(
            image: DecorationImage(
 image: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? AssetImage(
                    'lib/core/utils/appImages/images/backgroundDark.png')
                : AssetImage('lib/core/utils/appImages/images/background.png'),
              fit:
                  BoxFit.cover, // Optional: You can set the image fit as needed
            ),
          ),
   child: const Center(
        child: Text('my account'),
      ),
 );  }
}