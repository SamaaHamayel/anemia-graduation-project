abstract class MedicineState {}

class MedicineInitial extends MedicineState {}

class MedicineShapeChangeLoadingState extends MedicineState {}
class MedicineShapeChangeSuccessState extends MedicineState {}
class MedicineShapeChangeErrorState extends MedicineState {
  final String message;

  MedicineShapeChangeErrorState(this.message);
}

class AddMedicineLoadingState extends MedicineState {}
class AddMedicineSuccessState extends MedicineState {}
class AddMedicineErrorState extends MedicineState {}



class GetStartTimeLoadingState extends MedicineState {}

class GetStartTimeSuccessState extends MedicineState {}

class GetStartTimeErrorState extends MedicineState {}

class ChangeCheckMarkIndexState extends MedicineState {}

class InsertMedicineLoadingState extends MedicineState {}

class InsertMedicineSuccessState extends MedicineState {}

class InsertMedicineErrorState extends MedicineState {}
class GetMedicineLoadingState extends MedicineState {}

class GetMedicineSuccessState extends MedicineState {}

class GetMedicineErrorState extends MedicineState {}
class UpdateMedicineLoadingState extends MedicineState {}

class UpdateMedicineSuccessState extends MedicineState {}

class UpdateMedicineErrorState extends MedicineState {}
class DeleteMedicineLoadingState extends MedicineState {}

class DeleteMedicineSuccessState extends MedicineState {}

class DeleteMedicineErrorState extends MedicineState {}