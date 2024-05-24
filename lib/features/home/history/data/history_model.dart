class HistoryModel {
  final int? id;
  final String date;
  final String result;

  HistoryModel({this.id, required this.date, required this.result});

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'],
      date: json['date'],
      result: json['result'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'result': result,
    };
  }
}
