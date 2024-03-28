import 'package:clinic/core/commons/commons.dart';
import 'package:clinic/core/utiles/app_assets.dart';
import 'package:clinic/core/utiles/app_color.dart';
import 'package:clinic/core/utiles/app_strings.dart';
import 'package:clinic/core/widgets/button.dart';
import 'package:clinic/core/widgets/textFormField.dart';
import 'package:clinic/feature/auth/presentation/cubits/signUp_cubit/signUp_cubit.dart';
import 'package:clinic/feature/auth/presentation/cubits/signUp_cubit/signUp_state.dart';
import 'package:clinic/feature/auth/presentation/screens/signIn_screen.dart';
import 'package:clinic/feature/auth/presentation/screens/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PreSignUpScren extends StatelessWidget {
  const PreSignUpScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<PreSignUpCubit, PreSignUpdState>(
              listener: (context, state) {
            if (state is SucessPreSignUpState) {
              showToast(
                  message: 'check your personal account',
                  state: ToastStates.success);
              navigate(context: context, screen: SignUpSreen());
            }
            if (state is FailerPreSignUpState) {
              showToast(message: state.message, state: ToastStates.error);
            }
          }, builder: (context, state) {
            return BlocConsumer<PreSignUpCubit, PreSignUpdState>(
              listener: (context, state) {
                if (state is SucessPreSignUpState) {
                  showToast(
                      message: ' Check your personal accoun',
                      state: ToastStates.success);
                  navigate(context: context, screen: SignUpSreen());
                }
                if (state is FailerPreSignUpState) {
                  showToast(message: state.message, state: ToastStates.error);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Form(
                    key: BlocProvider.of<PreSignUpCubit>(context).presignUpKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.asset(ApppAssets.logo),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'we need to register your email before getting started !',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          prefixIcon: Icons.email,
                          hintText: AppStrings.email,
                          controller: BlocProvider.of<PreSignUpCubit>(context)
                              .preemailController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          text: AppStrings.sendCode,
                          color: AppColor.primary,
                          onPressed: () {
                             if (BlocProvider.of<PreSignUpCubit>(context)
                      .presignUpKey
                      .currentState!
                      .validate()) {
                            BlocProvider.of<PreSignUpCubit>(context)
                                .preSignUp();
                      }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                navigate(
                                    context: context,
                                    screen: const SignInScreen());
                              },
                              child: Text(
                                AppStrings.signIn,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                navigate(
                                    context: context,
                                    screen: const SignUpSreen());
                              },
                              child: Text(
                                AppStrings.signUp,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
