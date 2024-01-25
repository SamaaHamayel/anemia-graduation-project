
import 'package:animeacheck/core/error/error_model.dart';

import '../../domain/entities/register_entity.dart';

abstract class RegisterStates {}

class RegisterInitState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  RegisterEntity model;

  RegisterSuccessState(this.model);
}

class RegisterErrorState extends RegisterStates {
  ErrorModel errorModel;

  RegisterErrorState(this.errorModel);
}
