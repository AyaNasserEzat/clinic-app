import 'package:clinic/core/commons/commons.dart';
import 'package:clinic/core/utiles/app_assets.dart';
import 'package:clinic/core/utiles/app_color.dart';
import 'package:clinic/core/utiles/app_strings.dart';
import 'package:clinic/core/widgets/button.dart';
import 'package:clinic/core/widgets/container.dart';
import 'package:clinic/core/widgets/textFormField.dart';
import 'package:clinic/feature/auth/presentation/cubits/signIn_cubit/signIn_cubit.dart';
import 'package:clinic/feature/auth/presentation/cubits/signIn_cubit/signIn_state.dart';
import 'package:clinic/feature/auth/presentation/screens/forgetPassword.dart';
import 'package:clinic/feature/auth/presentation/screens/signUp_screen.dart';
import 'package:clinic/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.letstartSignUp,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              AppStrings.signIn,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 170,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomContainer(
                    height: 480,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: -90,
                  left: 30,
                  right: 30,
                  child: CustomContainer(
                    height: 400,
                    width: 300,
                    color: AppColor.primary,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: BlocConsumer<SignInCubit, SignInState>(
                          listener: (context, state) {
                            if (state is SucessSignInState) {
                              showToast(
                                  message: 'login sucessfully',
                                  state: ToastStates.success);
                              navigate(context: context, screen: HomeScreen());
                            }
                            if (state is FailerSignInState) {
                              showToast(
                                  message: state.message,
                                  state: ToastStates.error);
                            }
                          },
                          builder: (context, state) {
                            return Form(
                              key: BlocProvider.of<SignInCubit>(context)
                                  .signInKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 80,
                                        width: 60,
                                        child: Image.asset(ApppAssets.logo)),
                                    Text(
                                      AppStrings.appName,
                                      style: GoogleFonts.peralta(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    CustomTextFormField(
                                      controller:
                                          BlocProvider.of<SignInCubit>(context)
                                              .emilController,
                                      hintText: 'email',
                                      prefixIcon: Icons.email,
                                    ),
                                    CustomTextFormField(
                                      hintText: 'password',
                                      controller:
                                          BlocProvider.of<SignInCubit>(context)
                                              .passwordController,
                                      prefixIcon: Icons.lock,
                                      isPassword: true,
                                    ),
                                    state is LoadingSignInState
                                        ? const CircularProgressIndicator()
                                        : CustomButton(
                                            text: 'Sign in',
                                            color: AppColor.primary,
                                            onPressed: () {
                                              if (BlocProvider.of<SignInCubit>(
                                                      context)
                                                  .signInKey
                                                  .currentState!
                                                  .validate()) {
                                                BlocProvider.of<SignInCubit>(
                                                        context)
                                                    .signIn();
                                              }
                                            },
                                          ),
                                    TextButton(
                                      onPressed: () {
                                        ShowForgetPassword(context);
                                      },
                                      child: Text(
                                        'Forgot password ?',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have account?',
                        style: GoogleFonts.poppins(
                          color: AppColor.primary,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigate(
                              context: context, screen: const SignUpSreen());
                        },
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.poppins(
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
