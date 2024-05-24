import 'package:animeacheck/core/sqflite_helper/sqflite_helper.dart';
import 'package:animeacheck/features/auth/presentation/auth_cubit/sign_in_cubit.dart';
import 'package:animeacheck/features/auth/presentation/forgetPassword_cubit/forget_password_cubit.dart';
import 'package:animeacheck/features/auth/presentation/person_info_cubit/personal_info_cubit.dart';
import 'package:animeacheck/features/auth/presentation/signUp_cubit/sign_up_cubit.dart';
import 'package:animeacheck/features/home/medicine/medicine_cubit/medicine_cubit.dart';
import 'package:animeacheck/features/home/my_account/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:animeacheck/features/home/pri_home/presentation/detect_anemia_cubit/detect_anemia_cubit.dart';
import 'package:animeacheck/features/home/setting/presentation/settings_cubit/settings_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/domain/repo/auth_repo.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';
import '../cache_helper/cache_helper.dart';

final sl = GetIt.instance;

void initServiceLoactor(){
  //cubit
  sl.registerLazySingleton(()=> SignInCubit(sl()));
  sl.registerLazySingleton(()=> ForgetPasswordCubit(sl()));
  sl.registerLazySingleton(()=> SignUpCubit(sl()));
  sl.registerLazySingleton(()=> PersonalInfoCubit());
  sl.registerLazySingleton(()=> SettingsCubit());
  sl.registerLazySingleton(()=> DetectAnemiaCubit());
  sl.registerLazySingleton(()=> MedicineCubit());
  sl.registerLazySingleton(()=> EditProfileCubit());


  //auth feature
  sl.registerLazySingleton(() => AuthRepository());


  //external
  sl.registerLazySingleton(()=> CacheHelper());
  sl.registerLazySingleton(()=> SqfliteHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}