import 'package:clinic/core/commons/commons.dart';
import 'package:clinic/core/utiles/app_color.dart';
import 'package:clinic/core/utiles/app_strings.dart';
import 'package:clinic/core/widgets/button.dart';
import 'package:clinic/core/widgets/container.dart';
import 'package:clinic/core/widgets/textFormField.dart';
import 'package:clinic/core/widgets/textFormForCode.dart';
import 'package:clinic/feature/auth/presentation/cubits/forgetPassword_cubit/forgetPassword_cubit.dart';
import 'package:clinic/feature/auth/presentation/cubits/forgetPassword_cubit/forgetPassword_state.dart';
import 'package:clinic/feature/auth/presentation/screens/signIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void ShowRestPassword(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return  Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: CustomContainer(
            height: 570,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: BlocConsumer<ForgetPasswordCubit,ForgetPasswordState>(builder:(context, state) {return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.restPassword,
                      style: GoogleFonts.poppins(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.restPasswordSup,
                      style: GoogleFonts.poppins(
                        color: AppColor.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      AppStrings.enterCode,
                      style: GoogleFonts.poppins(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                   TextFormFordCode(
                    controller1: BlocProvider.of<ForgetPasswordCubit>(context).controller1,
                    controller2: BlocProvider.of<ForgetPasswordCubit>(context).controller2,
                    controller3: BlocProvider.of<ForgetPasswordCubit>(context).controller3,
                    controller4: BlocProvider.of<ForgetPasswordCubit>(context).controller4,
                    controller5: BlocProvider.of<ForgetPasswordCubit>(context).controller5,
                   ),
                        
                    ////
                     Text(
                      AppStrings.password,
                      style: GoogleFonts.poppins(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    CustomTextFormField(
                      borderColor: AppColor.primary,
                   isPassword: true,
                      controller: BlocProvider.of<ForgetPasswordCubit>(context).newPasswordController,
                    ),
                    ////////////////////
                     Text(
                      AppStrings.confirmPassword,
                      style: GoogleFonts.poppins(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    CustomTextFormField(
                      borderColor: AppColor.primary,
                       isPassword: true,
                      controller: BlocProvider.of<ForgetPasswordCubit>(context).confirmNewPasswordController,
                    ),
                  
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      text: AppStrings.restPassword,
                      backgroundColor: AppColor.primary,
                      color: Colors.white,
                      onPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context).resetPassword();
                       
                      },
                    ),
                  ],
                );},
                listener: (context, state) {
                   if (state is SucessResetePasswordState) {
                  showToast(message: state.message, state: ToastStates.success);
                  navigate(context: context, screen:  SignInScreen());
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SignInScreen();}));
                  
                }
                if (state is FailerResetePasswordState) {
                  showToast(message: state.message, state: ToastStates.error);
                }
                },
              ),
            ),
          
        ),
      ));
    },
  );
}
