import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'personal_info_state.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  PersonalInfoCubit() : super(PersonalInfoInitial());


  TextEditingController weightController = TextEditingController();

  GlobalKey<FormState> personalInfoKey = GlobalKey<FormState>();
  GlobalKey<FormState> personalInfoSecondKey = GlobalKey<FormState>();


  String groupValue = "Infants";

  void changeGroupValue(value) {
    groupValue = value;
    emit(ChangeGroupValueState());
  }


  String yesNoGroupValue = "Yes";

  void changePeriodGroupValue(value) {
    yesNoGroupValue = value;
    emit(ChangePeriodGroupValueState());
  }



}
