import 'package:animeacheck/core/error/error_model.dart';
import 'package:dartz/dartz.dart';
import '../entities/register_data.dart';
import '../entities/register_entity.dart';

abstract class RegisterDomainRepo {
  Future<Either<ErrorModel, RegisterEntity>?> register(RegisterData registerData);
}
