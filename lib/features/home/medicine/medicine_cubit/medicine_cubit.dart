import 'package:animeacheck/core/sqflite_helper/sqflite_helper.dart';
import 'package:animeacheck/features/home/medicine/domain/medicine_model/medicine_model.dart';
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

  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();


  int currentIndex=0;

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
      insertMedicine();
      emit(InsertMedicineSuccessState());
      //navigateReplacement(context: context, route: Routes.medicineComponent);
    } else {
      print("No Time Picked");
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
        return Image.asset(
            AppAssets.medicine11);
      case 1:
        return Image.asset(
            AppAssets.medicine2);
      case 2:
        return Image.asset(
            AppAssets.medicine3);
      case 3:
        return Image.asset(
            AppAssets.medicine4);
      default:
        return Image.asset(
            AppAssets.medicine1);
    }
  }



  //insert Medicine

  List<MedicineModel> medicineList = [];
  void insertMedicine() async {
    emit(InsertMedicineLoadingState());

    try {
      await sl<SqfliteHelper>().insertToDB(
        MedicineModel(
          medicineName: medicineNameController.text,
          medicineDose: int.parse(medicineDoseController.text),
          medicineShape: getImage(currentIndex),
          startTime: startTime
        ),
      );

      LocalNotificationService.showSchduledNotification(
        curretDate: currentDate,
        schduledTime:schduledTime,
        medicineModel: MedicineModel(
          medicineName: medicineNameController.text,
          medicineDose: int.parse(medicineDoseController.text),
          medicineShape: getImage(currentIndex),
          startTime: startTime
        ),
      );
      medicineNameController.clear();
      medicineDoseController.clear();
      emit(InsertMedicineSuccessState());
      getMedicine();
    } catch (e) {
      emit(InsertMedicineErrorState());
    }
  }




//!get Medicine

  void getMedicine() async {
    emit(GetMedicineLoadingState());
    await sl<SqfliteHelper>().getFromDB().then((value) {
      medicineList = value
          .map((e) => MedicineModel.fromJson(e)).toList();
      //     .where(
      //       (element) => element.date == DateFormat.yMd().format(selctedDate),
      // )
         // .toList();
      emit(GetMedicineSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetMedicineErrorState());
    });
  }

//   //update Medicine
//   void updateTask(id) async {
//     emit(UpdateTaskLoadingState());
//
//     await sl<SqfliteHelper>().updatedDB(id).then((value) {
//       emit(UpdateTaskSucessState());
//       getTasks();
//     }).catchError((e) {
//       print(e.toString());
//       emit(UpdateTaskErrorState());
//     });
//   }
//


 //delete Medicine


  void deleteTask(id) async {
    emit(DeleteMedicineLoadingState());

    await sl<SqfliteHelper>().deleteFromDB(id).then((value) {
      emit(DeleteMedicineSuccessState());
      getMedicine();
    }).catchError((e) {
      print(e.toString());
      emit(DeleteMedicineErrorState());
    });
  }



    }
