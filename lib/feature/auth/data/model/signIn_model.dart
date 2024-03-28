import 'package:clinic/core/database/api/end_points.dart';

class SignInModel {
  final String message;
  final String accessToken;

  SignInModel({
    required this.message,
    required this.accessToken,
  });
  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      message: jsonData[ApiKeys.message],
      accessToken: jsonData[ApiKeys.accessToken],
    );
  }
}