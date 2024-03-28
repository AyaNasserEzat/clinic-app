import 'package:clinic/core/database/api/api_concumer.dart';
import 'package:clinic/core/database/api/dio_concumer.dart';
import 'package:clinic/core/database/cache/cach_helper.dart';
import 'package:clinic/feature/auth/data/repository/auth_repository.dart';
import 'package:clinic/feature/auth/presentation/cubits/forgetPassword_cubit/forgetPassword_cubit.dart';
import 'package:clinic/feature/auth/presentation/cubits/signIn_cubit/signIn_cubit.dart';
import 'package:clinic/feature/auth/presentation/cubits/signUp_cubit/signUp_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLoactor() {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => SignInCubit(sl()));
  sl.registerLazySingleton(() => ForgetPasswordCubit(sl()));
  sl.registerLazySingleton(() => PreSignUpCubit(sl()));

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
}
