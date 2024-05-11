import 'package:flutter/material.dart';

class MedicineModel {
  final int? id;
  final String medicineName;
  final int medicineDose;
  final Image medicineShape;
  final String startTime;
 // final String endTime;


  MedicineModel({
    this.id,
    required this.medicineName,
    required this.medicineDose,
    required this.medicineShape,
    required this.startTime,

  });

  factory MedicineModel.fromJson(Map<String, dynamic> jsonData) {
    return MedicineModel(
      id: jsonData["id"],
      medicineName: jsonData["medicineName"],
      medicineDose: jsonData["medicineDose"],
      medicineShape: jsonData["medicineShape"],
      startTime: jsonData["startTime"],
    );
  }
}
