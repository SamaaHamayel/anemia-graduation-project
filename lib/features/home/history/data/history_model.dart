import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryModel {
  final int id;
  final String date;
  final String result;

  HistoryModel({
    required this.id,
    required this.date,
    required this.result,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'result': result,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      id: map['id'],
      date: map['date'],
      result: map['result'],
    );
  }
  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) =>
      HistoryModel.fromMap(json.decode(source));

  static List<HistoryModel> historyList = [];
}

class HistoryService {
  static const String _historyKey = 'historyList';
  static Future<void> saveHistoryList(List<HistoryModel> historyList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        historyList.map((history) => history.toJson()).toList();
    await prefs.setStringList(_historyKey, jsonList);
  }

  static Future<List<HistoryModel>> loadHistoryList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_historyKey);
    if (jsonList == null) {
      return [];
    } else {
      return jsonList.map((json) => HistoryModel.fromJson(json)).toList();
    }
  }
}
