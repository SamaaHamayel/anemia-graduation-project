import 'package:animeacheck/conf/routes/routes.dart';
import 'package:animeacheck/conf/theme/my_them.dart';
import 'package:animeacheck/features/auth/presentation/view/sign_up_screen.dart';
import 'package:animeacheck/features/home/presentation/view/home.dart';

import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_state.dart';
import 'package:animeacheck/features/started/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.initialRoutes,
            onGenerateRoute: AppRoutes.generateRoute,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("en"),
              Locale("ar"),
            ],
            //(Iterable----> parent class of list),oop(polymorphism)
            locale: Locale(
                BlocProvider.of<SettingsCubit>(context).isArabicEnable
                    ? "ar"
                    : "en"),

            theme: MyThemeData.lightTheme,
            darkTheme: MyThemeData.darkTheme,
            themeMode: BlocProvider.of<SettingsCubit>(context).isDarkThemEnable
                ? ThemeMode.dark
                : ThemeMode.light,

            home: const SignUpScreen(),
          );
        },
      ),
    );
  }
}
