import 'package:clinic/core/commons/commons.dart';
import 'package:clinic/core/utiles/app_assets.dart';
import 'package:clinic/core/utiles/app_color.dart';
import 'package:clinic/core/utiles/app_strings.dart';
import 'package:clinic/core/widgets/button.dart';
import 'package:clinic/core/widgets/showDialog.dart';
import 'package:clinic/core/widgets/textFormField.dart';
import 'package:clinic/core/widgets/container.dart';
import 'package:clinic/feature/auth/presentation/cubits/signUp_cubit/signUp_cubit.dart';
import 'package:clinic/feature/auth/presentation/cubits/signUp_cubit/signUp_state.dart';
import 'package:clinic/feature/auth/presentation/screens/signIn_screen.dart';
import 'package:clinic/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpSreen extends StatelessWidget {
  const SignUpSreen({super.key});

  @override
  Widget build(BuildContext context) {
    //show dialog
    showDialogForCode(context);

    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SingleChildScrollView(
          child: BlocConsumer<PreSignUpCubit, PreSignUpdState>(
              listener: (context, state) {
        if (state is FailerPreSignUpState) {
          showToast(message: state.message, state: ToastStates.error);
        }
        if (state is SucessSignUpState) {
          showToast(
              message: ' The account was created successfully',
              state: ToastStates.success);
          navigate(context: context, screen: HomeScreen());
        }
      }, builder: (context, state) {
        return Column(
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
              AppStrings.signUp,
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
                  top: -160,
                  left: 30,
                  right: 30,
                  child: CustomContainer(
                    height: 580,
                    width: 300,
                    color: AppColor.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: BlocProvider.of<PreSignUpCubit>(context).signUpKey,
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
                                hintText: 'Name',
                                validate: (data) {
                                  if (data!.isEmpty) {
                                    return 'please Enter name';
                                  }
                                  return null;
                                },
                                prefixIcon: Icons.person,
                                controller:
                                    BlocProvider.of<PreSignUpCubit>(context)
                                        .name,
                              ),
                              CustomTextFormField(
                                hintText: 'phone number',
                                prefixIcon: Icons.phone,
                                validate: (data) {
                                  if (data!.length < 11 || data.isEmpty) {
                                    return 'please Enter Valid phone number';
                                  }
                                  return null;
                                },
                                controller:
                                    BlocProvider.of<PreSignUpCubit>(context)
                                        .phone,
                              ),
                              CustomTextFormField(
                                hintText: 'email',
                                prefixIcon: Icons.email,
                                controller:
                                    BlocProvider.of<PreSignUpCubit>(context)
                                        .preemailController,
                              ),
                              CustomTextFormField(
                                hintText: 'password',
                                prefixIcon: Icons.lock,
                                controller:
                                    BlocProvider.of<PreSignUpCubit>(context)
                                        .signUpPasswordController,
                                isPassword: true,
                              ),
                              CustomTextFormField(
                                hintText: 'confirm password',
                                isPassword: true,
                                prefixIcon: Icons.lock,
                                controller:
                                    BlocProvider.of<PreSignUpCubit>(context)
                                        .signUpCPasswordController,
                              ),
                              CustomButton(
                                text: 'Sign Up',
                                color: AppColor.primary,
                                onPressed: () async {
                                  if (BlocProvider.of<PreSignUpCubit>(context)
                                          .signUpKey
                                          .currentState!
                                          .validate() &&
                                      (BlocProvider.of<PreSignUpCubit>(context)
                                              .signUpPasswordController ==
                                          BlocProvider.of<PreSignUpCubit>(
                                                  context)
                                              .signUpCPasswordController)) {
                                    await BlocProvider.of<PreSignUpCubit>(
                                            context)
                                        .signUp();
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have alreadyan account?',
                        style: GoogleFonts.poppins(
                          color: AppColor.primary,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigate(
                              context: context, screen: const SignInScreen());
                        },
                        child: Text(
                          'Sign in',
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
        );
      })),
    );
  }
}
