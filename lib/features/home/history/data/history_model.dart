import 'dart:typed_data';

class HistoryModel {
  final int? id;
  final String date;
  final String result;
  final Uint8List image;

  HistoryModel({this.id, required this.date, required this.result, required this.image});

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'],
      date: json['date'],
      result: json['result'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'result': result,
      'image': image,
    };
  }
}
