import 'package:clinic/core/database/api/end_points.dart';
import 'package:clinic/core/database/cache/cach_helper.dart';
import 'package:clinic/core/services/service_lcator.dart';
import 'package:clinic/feature/auth/data/model/signIn_model.dart';
import 'package:clinic/feature/auth/data/repository/auth_repository.dart';
import 'package:clinic/feature/auth/presentation/cubits/signIn_cubit/signIn_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepository) : super(InitialSignInState());
  final AuthRepository authRepository;
    GlobalKey<FormState>signInKey=GlobalKey<FormState>();
  TextEditingController emilController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignInModel? signInModel;
  void signIn() async {
    emit(LoadingSignInState());
    final result = await authRepository.signIn(
      email: emilController.text,
      password: passwordController.text,
    );
    result.fold(
      (l) => emit(FailerSignInState(l)),
      (r) async {
        signInModel = r;
        Map<String, dynamic> decodedToken = JwtDecoder.decode(r.accessToken);
        await sl<CacheHelper>().saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
         await sl<CacheHelper>().saveData( key: ApiKeys.accessToken, value: r.accessToken, );
        emit(SucessSignInState());
      },
    );
  }



}
