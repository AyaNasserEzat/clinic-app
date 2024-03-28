import 'package:clinic/app/app.dart';
import 'package:clinic/core/database/cache/cach_helper.dart';
import 'package:clinic/core/services/service_lcator.dart';
import 'package:clinic/feature/auth/presentation/cubits/forgetPassword_cubit/forgetPassword_cubit.dart';
import 'package:clinic/feature/auth/presentation/cubits/signIn_cubit/signIn_cubit.dart';
import 'package:clinic/feature/auth/presentation/cubits/signUp_cubit/signUp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
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
          create: (context) => sl<PreSignUpCubit>(),
        ),
        
      ],
      child:
    const MyApp()));
}
