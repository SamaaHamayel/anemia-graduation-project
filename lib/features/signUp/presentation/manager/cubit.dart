import 'package:animeacheck/features/signUp/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/register_data_source.dart';
import '../../data/repositories/register_data_repo.dart';
import '../../domain/entities/register_data.dart';
import '../../domain/repositories/register_domain_repo.dart';
import '../../domain/use_cases/register_use_case.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterDataSource dataSource;

  RegisterCubit(this.dataSource) : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var formKEy = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  register() async {
    RegisterDomainRepo domainRepo = RegisterDataRepo(dataSource);
    RegisterUserCase userCase = RegisterUserCase(domainRepo);

    RegisterData data = RegisterData(
        "mai", "Mai333333@gmail.com", "123456789", "123456789", "01110588669");
    userCase.call(data).then((value) {
      value?.fold((l) {
        emit(RegisterErrorState(l));
      }, (r) {
        emit(RegisterSuccessState(r));
      });
    });
  }
}
