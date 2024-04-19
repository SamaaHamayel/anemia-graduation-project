//الحاجات اللى انا بستخدمها من المودل 
//  نسخة مصغرة من المودل او المودل بس متفلتر


import '../../../../core/api/endPoints/end_point.dart';

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


class SignUpModel {
  final String message;
  final String token;

  SignUpModel({
    required this.message,
    required this.token,
  });
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      message: jsonData[ApiKeys.message],
      token: jsonData[ApiKeys.token],
    );
  }
}