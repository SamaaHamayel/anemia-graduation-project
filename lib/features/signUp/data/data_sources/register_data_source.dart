import 'package:animeacheck/core/error/error_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/endPoints/endPoint.dart';
import '../../domain/entities/register_data.dart';
import '../models/RegisterModel.dart';

abstract class RegisterDataSource {
  Future<Either<ErrorModel, RegisterModel>?> register(RegisterData registerData);
}

class RemoteDataSource implements RegisterDataSource {
  @override
  Future<Either<ErrorModel, RegisterModel>?> register(registerData) async {
    final dio = Dio();
    try {
      var value =
          await dio.post("${EndPoint.baseUrl}${EndPoint.chefSignUp}", data: {
        "name": registerData.name,
        "email": registerData.email,
        "password": registerData.password,
        "rePassword": registerData.password,
        "phone": registerData.phone
      });

      if (value.statusCode == 201 || value.statusCode == 200) {
        RegisterModel registerModel = RegisterModel.fromJson(value.data);
        return Right(registerModel);
      }
    } catch (e) {
      return Left(ErrorModel(status: 400, errorMessage: e.toString()));
    }
  }
}

class LocalDataSource implements RegisterDataSource {
  @override
  Future<Either<ErrorModel, RegisterModel>?> register(RegisterData registerData) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
