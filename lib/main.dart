import 'package:animeacheck/features/auth/presentation/auth_cubit/sign_in_cubit.dart';
import 'package:animeacheck/features/auth/presentation/forgetPassword_cubit/forget_password_cubit.dart';
import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cache_helper/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLoactor();
  await sl<CacheHelper>().init();

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
      ],
      child: const MyApp(),
    ),
  );
}
