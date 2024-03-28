import 'package:clinic/feature/auth/data/repository/auth_repository.dart';
import 'package:clinic/feature/auth/presentation/cubits/forgetPassword_cubit/forgetPassword_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepository)
      : super(InitialForgetPasswordState());
  final AuthRepository authRepository;
  TextEditingController emailForgetPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();


TextEditingController controller1=TextEditingController();
TextEditingController controller2=TextEditingController();
TextEditingController controller3=TextEditingController();
TextEditingController controller4=TextEditingController();
TextEditingController controller5=TextEditingController();

  void forgetPasswordSendCode() async {
    emit(LoadingForgetPasswordState());
    final res = await authRepository.forgetPassword(
        email: emailForgetPasswordController.text);
    res.fold((l) => emit(FailerForgetPasswordState(l)),
        (r) => emit(SucessForgetPasswordState(r)));
  }

  void resetPassword() async {
    emit(LoadingResetetPasswordState());
    final res = await authRepository.resetPassword(
        email: emailForgetPasswordController.text,
        newPassword: newPasswordController.text,
        otp: controller1.text+controller2.text+controller3.text+controller4.text+controller5.text);
    res.fold((l) => emit(FailerResetePasswordState(l)),
        (r) =>emit( SucessResetePasswordState(r)));
  }
}
