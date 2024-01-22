//الحاجات اللى انا بستخدمها من المودل 
//  نسخة مصغرة من المودل او المودل بس متفلتر


import '../../../../core/api/endPoints/endPoint.dart';

class SignInModel {
  final String message;
  final String token;

  SignInModel({
    required this.message,
    required this.token,
  });
  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      message: jsonData[ApiKeys.message],
      token: jsonData[ApiKeys.token],
    );
  }
}