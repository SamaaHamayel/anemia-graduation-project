// class HistoryModel {
//   final int? id;
//   final String date;
//   final String result;
//
//   HistoryModel({this.id, required this.date, required this.result});
//
//   factory HistoryModel.fromJson(Map<String, dynamic> json) {
//     return HistoryModel(
//       id: json['id'],
//       date: json['date'],
//       result: json['result'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'date': date,
//       'result': result,
//     };
//   }
// }
//___________________________


import 'dart:typed_data';

class HistoryModel {
  final int id;
  final Uint8List image;
  final String date;
  final String result;

  HistoryModel({
    required this.id,
    required this.image,
    required this.date,
    required this.result,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'],
      image: json['image'],
      date: json['date'],
      result: json['result'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'date': date,
      'result': result,
    };
  }
}