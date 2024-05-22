import 'package:animeacheck/features/home/history/data/history_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/sqflite_helper/sqflite_helper.dart';
import 'history_state.dart';
import '../../../../core/services/service_locator.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  List<HistoryModel> historyList = [];

  void getHistory() async {
    emit(GetHistoryLoadingState());
    try {
      final data = await sl<SqfliteHelper>().getHistoryFromDB();
      historyList = data.map((e) => HistoryModel.fromJson(e)).toList();
      emit(GetHistorySuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetHistoryErrorState());
    }
  }

  Future<void> insertHistory(HistoryModel model) async {
    emit(InsertHistoryLoadingState());
    try {
      await sl<SqfliteHelper>().initDB();
      getHistory();
      emit(InsertHistorySuccessState());
    } catch (e) {
      emit(InsertHistoryErrorState());
    }
  }

  void deleteHistory(int id) async {
    emit(DeleteHistoryLoadingState());
    try {
      await sl<SqfliteHelper>().deleteHistory(id);
      getHistory();
      emit(DeleteHistorySuccessState());
    } catch (e) {
      emit(DeleteHistoryErrorState());
    }
  }
}
