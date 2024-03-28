import 'package:clinic/core/database/api/end_points.dart';

class PreSignUpModel {
  final String message;
  final String token;

  PreSignUpModel({
    required this.message,
    required this.token,
  });
  factory PreSignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return PreSignUpModel(
      message: jsonData[ApiKeys.message],
      token: jsonData['token'],
    );
  }
}