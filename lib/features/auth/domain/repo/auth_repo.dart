import 'package:animeacheck/features/auth/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/endPoints/endPoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/service_locator.dart';

class AuthRepository {
  //!!1 login
  Future<Either<String, SignInModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.chefSignIn,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );
      return Right(SignInModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }


  //!!! signUp
Future<Either<String, SignUpModel>> signUp({
  required String name,
  required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.chefSignUp,
        data: {
          ApiKeys.email: email,
          ApiKeys.name: name,
          ApiKeys.password: password,
          ApiKeys.confirmPassword: confirmPassword,
        },
      );
      return Right(SignUpModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }


  //!!! sendCode
  Future<Either<String, String>> sendCode(String email) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.sendCode,
        data: {
          ApiKeys.email: email,
        },
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }



  //!!! resetPassword
  Future<Either<String, String>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,
  }) async {
    try {
      final response = await sl<ApiConsumer>().patch(
        EndPoint.changeForgottenPassword,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
          ApiKeys.confirmPassword: confirmPassword,
          ApiKeys.code: code,
        },
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}