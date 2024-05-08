import 'package:flutter/material.dart';

class MedicineModel {
  final String medicineName;
  final int medicineDose;
  final Image medicineShape;

  MedicineModel({
    required this.medicineName,
    required this.medicineDose,
    required this.medicineShape,

  });

  factory MedicineModel.fromJson(Map<String, dynamic> jsonData) {
    return MedicineModel(
      medicineName: jsonData["medicineName"],
      medicineDose: jsonData["medicineDose"],
      medicineShape: jsonData["medicineShape"],
    );
  }
}
