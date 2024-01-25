import 'package:animeacheck/core/error/error_model.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/register_data.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repositories/register_domain_repo.dart';
import '../data_sources/register_data_source.dart';

class RegisterDataRepo implements RegisterDomainRepo {
  RegisterDataSource registerDataSource;

  RegisterDataRepo(this.registerDataSource);

  @override
  Future<Either<ErrorModel, RegisterEntity>?> register(
      RegisterData registerData) {
    return registerDataSource.register(registerData);
  }
}
