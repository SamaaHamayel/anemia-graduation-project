import 'package:animeacheck/core/error/error_model.dart';
import 'package:dartz/dartz.dart';

import '../entities/register_data.dart';
import '../entities/register_entity.dart';
import '../repositories/register_domain_repo.dart';

class RegisterUserCase {
  RegisterDomainRepo registerDomainRepo;

  RegisterUserCase(this.registerDomainRepo);

  Future<Either<ErrorModel, RegisterEntity>?> call(RegisterData registerData) =>
      registerDomainRepo.register(registerData);
}
