import 'package:clinic/feature/auth/presentation/screens/onbording_screens.dart';
import 'package:clinic/feature/auth/presentation/screens/pre_signUp_screen.dart';
import 'package:clinic/feature/auth/presentation/screens/signIn_screen.dart';
import 'package:clinic/feature/auth/presentation/screens/signUp_screen.dart';
import 'package:clinic/feature/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home:SplashScreen() ,
    
    );
  }
}