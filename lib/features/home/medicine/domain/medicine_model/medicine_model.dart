class MedicineModel {
  final int? id;
  final String medicineName;
  final int medicineDose;
  final int medicineShape;
  final String startTime;
  //final int isComplete;
  // final String endTime;
  MedicineModel({
    this.id,
    required this.medicineName,
    required this.medicineDose,
    required this.medicineShape,
    required this.startTime,
    //required this.isComplete,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> jsonData) {
    return MedicineModel(
      id: jsonData["id"],
      //isComplete: jsonData["isComplete"],
      medicineName: jsonData["name"],
      medicineDose: jsonData["dose"],
      medicineShape: jsonData["shape"],
      startTime: jsonData["startTime"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medicineName': medicineName,
      'medicineDose': medicineDose,
      'medicineShape': medicineShape,
      'startTime': startTime,
    };
  }
}
