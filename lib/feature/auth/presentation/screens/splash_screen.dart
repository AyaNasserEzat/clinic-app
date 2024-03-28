import 'package:clinic/core/database/cache/cach_helper.dart';
import 'package:clinic/core/services/service_lcator.dart';
import 'package:clinic/core/utiles/app_assets.dart';
import 'package:clinic/core/utiles/app_color.dart';
import 'package:clinic/core/utiles/app_strings.dart';
import 'package:clinic/feature/auth/presentation/screens/onbording_screens.dart';
import 'package:clinic/feature/auth/presentation/screens/pre_signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }
  void navigate()async{
    bool isVisted = await sl<CacheHelper>().getData(
          key: 'onBoardingKey',
        ) ??
        false;
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return isVisted?const PreSignUpScren(): onBordingSreens();
      }));
    } ,);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(ApppAssets.logo),
          Text(AppStrings.appName,style: GoogleFonts.peralta(
            color: AppColor.primary,
            fontSize:24,
          ),)
        ],),
      ),
    );
  }
}