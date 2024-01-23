import 'package:animeacheck/features/auth/presentation/auth_cubit/sign_in_cubit.dart';
import 'package:animeacheck/features/auth/presentation/forgetPassword_cubit/forget_password_cubit.dart';
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


  //auth feature
  sl.registerLazySingleton(() => AuthRepository());


  //external
  sl.registerLazySingleton(()=> CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}