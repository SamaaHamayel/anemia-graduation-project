import 'package:animeacheck/conf/routes/routes.dart';
import 'package:animeacheck/features/startted/splach/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.intialRoutes,
        onGenerateRoute: AppRoutes.generateRoute,
        home:  SplashView(),
      ),
    );
  }
}

