import 'dart:developer';

import 'package:animeacheck/core/sqflite_helper/sqflite_helper.dart';
import 'package:animeacheck/core/utils/common.dart';
import 'package:animeacheck/features/home/medicine/domain/medicine_model/medicine_model.dart';
import 'package:animeacheck/features/home/medicine/presentation/medicine_widgets/add_medicine_button_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/services/local_notification_service.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/appImages/app_assets.dart';
import 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineInitial());

  GlobalKey<FormState> addMedicineKey = GlobalKey<FormState>();
  TextEditingController medicineNameController = TextEditingController();
  TextEditingController medicineDoseController = TextEditingController();

  String startTime = DateFormat("hh:mm:a").format(DateTime.now());
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  int isEditing = 0;
  int currentIndex = 0;


  late TimeOfDay schduledTime;

  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      schduledTime = pickedStartTime;
      emit(GetStartTimeSuccessState());
      // insertMedicine();
      //emit(InsertMedicineSuccessState());
      //navigateReplacement(context: context, route: Routes.medicineComponent);
    } else {
      showToast(message: "No Time Picked", state: ToastStates.success);
      schduledTime =
          TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);

      emit(GetStartTimeErrorState());
    }
  }

  void changeCheckMarkIndex(index) {
    currentIndex = index;
    emit(ChangeCheckMarkIndexState());
  }

  Image getImage(index) {
    switch (index) {
      case 0:
        return Image.asset(AppAssets.medicine11);
      case 1:
        return Image.asset(AppAssets.medicine2);
      case 2:
        return Image.asset(AppAssets.medicine3);
      case 3:
        return Image.asset(AppAssets.medicine4);
      default:
        return Image.asset(AppAssets.medicine1);
    }
  }

  //insert Medicine

  List<MedicineModel> medicineList = [];

  void insertMedicine() async {
    emit(InsertMedicineLoadingState());
    try {
      int medicineDose = int.parse(medicineDoseController.text);
      sl<SqfliteHelper>().insertMedicine(
        model: MedicineModel(
          //isEditing: isEditing,
          medicineName: medicineNameController.text,
          medicineDose: medicineDose,
          medicineShape: currentIndex,
          startTime: startTime,
        ),
      );
      LocalNotificationService.showSchduledNotification(
        currentDate: currentDate,
        schduledTime:schduledTime,
        medicineModel: MedicineModel(
          medicineName: medicineNameController.text,
          medicineDose: medicineDose,
          medicineShape: currentIndex,
          startTime: startTime,
        ),

      );
      if (kDebugMode) {
        print(medicineList.length);
      }
      getMedicine();
      medicineNameController.clear();
      medicineDoseController.clear();
      startTime = DateFormat("hh:mm:a").format(DateTime.now());
      emit(InsertMedicineSuccessState());
    } catch (e) {
      log(e.toString());
      emit(InsertMedicineErrorState());
    }
  }


//!get Medicine
  void getMedicine() async {
    //list of map to our empty list
    emit(GetMedicineLoadingState());
    await sl<SqfliteHelper>().getMedicinesFromDB().then((value) {
      medicineList = value.map((e) => MedicineModel.fromJson(e)).toList();
      emit(GetMedicineSuccessState());
    }).catchError((e) {
      log(e.toString());
      emit(GetMedicineErrorState());
    });
  }

//   //edit Medicine
  void editMedicine(id) async {
    emit(EditMedicineLoadingState());

    await sl<SqfliteHelper>().editMedicineFromDB(id).then((value) {
      emit(EditMedicineSuccessState());
      const AddMedicineButtonSheet(readOnly: false, hintText: "edit");
    }).catchError((e) {
      log(e.toString());
      emit(EditMedicineErrorState());
    });
  }

  //delete Medicine
  void deleteMedicine(id) async {
    emit(DeleteMedicineLoadingState());
    await sl<SqfliteHelper>().deleteMedicine(id).then((value) {
      emit(DeleteMedicineSuccessState());
      getMedicine();
    }).catchError((e) {
      log(e.toString());
      emit(DeleteMedicineErrorState());
    });
  }
}
