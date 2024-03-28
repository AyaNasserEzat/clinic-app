import 'dart:math';

import 'package:clinic/core/database/api/api_concumer.dart';
import 'package:clinic/core/database/api/end_points.dart';
import 'package:clinic/core/error/exception.dart';
import 'package:clinic/core/services/service_lcator.dart';
import 'package:clinic/feature/auth/data/model/pre_signUp_model.dart';
import 'package:clinic/feature/auth/data/model/signIn_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Future<Either<String, SignInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.pSignIn, data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
      });
      return right(SignInModel.fromJson(response));
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }

  /////////////////////////forget password send code
  Future<Either<String, String>> forgetPassword({required String email}) async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoint.pForgetPassword, data: {
        ApiKeys.email: email,
      });
      return Right(response[ApiKeys.message]);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }

  ///////////////////////////////reste passwrd
  Future<Either<String, String>> resetPassword(
      {required email,
      required String newPassword,
      required String otp}) async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoint.pResetPassword, data: {
        ApiKeys.email: email,
        ApiKeys.newPassword: newPassword,
        ApiKeys.otp: otp,
      });
      return right(response[ApiKeys.message]);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }

  ///////////////////////////////pre sign up sen code
  Future<Either<String, PreSignUpModel>> preSignUp(
      {required String email}) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.pPreSignUp, data: {
        ApiKeys.email: email,
      });
      return right(PreSignUpModel.fromJson(response));
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }

  /////////////////////////////////sign up
  Future<Either<String, String>> signUp({
    required String name,
    required String token,
    required String otp,
    required String phone,
    required String email,
    required String password,
    required String cPassword,
  }) async {
    try {
      final response = await sl<ApiConsumer>()
          .post(EndPoint.pSignUp, isFormData: true, data: {
        ApiKeys.name: name,
        ApiKeys.phone: phone,
        ApiKeys.email: email,
        ApiKeys.password: password,
        ApiKeys.cPassword: cPassword,
        ApiKeys.otp: otp,
        ApiKeys.token: token,
      });
      return right(response[ApiKeys.message]);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }
}
