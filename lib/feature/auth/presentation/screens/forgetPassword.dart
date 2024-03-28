import 'package:clinic/core/commons/commons.dart';
import 'package:clinic/core/utiles/app_color.dart';
import 'package:clinic/core/utiles/app_strings.dart';
import 'package:clinic/core/widgets/button.dart';
import 'package:clinic/core/widgets/container.dart';
import 'package:clinic/core/widgets/textFormField.dart';
import 'package:clinic/feature/auth/presentation/cubits/forgetPassword_cubit/forgetPassword_cubit.dart';
import 'package:clinic/feature/auth/presentation/cubits/forgetPassword_cubit/forgetPassword_state.dart';
import 'package:clinic/feature/auth/presentation/screens/RestPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void ShowForgetPassword(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: CustomContainer(
          height: 350,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                  builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.forgetPassword,
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
                      AppStrings.forgetPasswordSup,
                      style: GoogleFonts.poppins(
                        color: AppColor.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      AppStrings.email,
                      style: GoogleFonts.poppins(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    CustomTextFormField(
                      prefixIcon: Icons.email,
                      borderColor: AppColor.primary,
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .emailForgetPasswordController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    state is LoadingForgetPasswordState
                        ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: CircularProgressIndicator()),
                          ],
                        )
                        : CustomButton(
                            text: AppStrings.Continue,
                            backgroundColor: AppColor.primary,
                            color: Colors.white,
                            onPressed: () {
                              BlocProvider.of<ForgetPasswordCubit>(context)
                                  .forgetPasswordSendCode();
                            },
                          ),
                  ],
                );
              }, listener: (context, state) {
                if (state is SucessForgetPasswordState) {
                  showToast(message: state.message, state: ToastStates.success);
                  ShowRestPassword(context);
              
                }
                if (state is FailerForgetPasswordState) {
                  showToast(message: state.message, state: ToastStates.error);
                }
              })),
        ),
      );
    },
  );
}
