import 'package:clinic/feature/auth/data/model/pre_signUp_model.dart';
import 'package:clinic/feature/auth/data/repository/auth_repository.dart';
import 'package:clinic/feature/auth/presentation/cubits/signUp_cubit/signUp_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreSignUpCubit extends Cubit<PreSignUpdState> {
  PreSignUpCubit(this.authRepository) : super(InitialPreSignUpState());
  final AuthRepository authRepository;
  GlobalKey<FormState>signUpKey=GlobalKey<FormState>();
  GlobalKey<FormState>presignUpKey=GlobalKey<FormState>();
  TextEditingController preemailController = TextEditingController();
  TextEditingController signUpemailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpCPasswordController = TextEditingController();
  TextEditingController ctr1 = TextEditingController();
  TextEditingController ctr2 = TextEditingController();
  TextEditingController ctr3 = TextEditingController();
  TextEditingController ctr4 = TextEditingController();
  TextEditingController ctr5 = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  PreSignUpModel? preSignUpModel;
  preSignUp() async {
    emit(LoadingPreSignUpState());
    final res = await authRepository.preSignUp(email: preemailController.text);
    res.fold((l) => emit(FailerPreSignUpState(l)), (r) async {
      preSignUpModel = r;
      emit(SucessPreSignUpState());
      // Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
      // await sl<CacheHelper>()
      //     .saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
      // await sl<CacheHelper>().saveData(
      //   key: 'token',
      //   value: r.token,
      // );
    });
  }

   signUp() async {
    final res = await authRepository.signUp(
        name: name.text,
        token: preSignUpModel!.token,
        otp: ctr1.text + ctr2.text + ctr3.text + ctr4.text + ctr5.text,
        phone: phone.text,
        email: signUpemailController.text,
        password: signUpPasswordController.text,
        cPassword: signUpPasswordController.text);

    res.fold((l) => FailerSignUpState(l), (r)  {
       emit(SucessSignUpState());
    });
  }
}
