import 'package:animeacheck/core/services/local_notification_service.dart';
import 'package:animeacheck/core/services/work_manager_service.dart';
import 'package:animeacheck/features/auth/presentation/auth_cubit/sign_in_cubit.dart';
import 'package:animeacheck/features/auth/presentation/forgetPassword_cubit/forget_password_cubit.dart';
import 'package:animeacheck/features/auth/presentation/person_info_cubit/personal_info_cubit.dart';
import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_cubit.dart';
import 'package:animeacheck/features/home/medicine/medicine_cubit/medicine_cubit.dart';
import 'package:animeacheck/features/home/pri_home/presentation/detect_anemia_cubit/detect_anemia_cubit.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/cache_helper/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'core/sqflite_helper/sqflite_helper.dart';
import 'core/utils/bloc_observer/bloc_observer.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLoactor();
  Bloc.observer = SimpleBlocObserver();
  await sl<CacheHelper>().init();
   sl<SqfliteHelper>().initDB();
  await Future.wait([
    LocalNotificationService.init(),
    WorkManagerService().init(),
  ]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SignInCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ForgetPasswordCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SignUpCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<PersonalInfoCubit>(),
        ),

        BlocProvider(
          create: (context) => sl<SettingsCubit>()..getThem()..getLang(),
        ),

        BlocProvider(
          create: (context) => sl<DetectAnemiaCubit>(),
        ),

        BlocProvider(
          create: (context) => sl<MedicineCubit>()..getMedicine(),
        ),

      ],
      child: const MyApp(),
    ),
  );
}
