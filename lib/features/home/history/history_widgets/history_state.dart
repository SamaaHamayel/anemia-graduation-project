abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class GetHistoryLoadingState extends HistoryState {}

class GetHistorySuccessState extends HistoryState {}

class GetHistoryErrorState extends HistoryState {}

class InsertHistoryLoadingState extends HistoryState {}

class InsertHistorySuccessState extends HistoryState {}

class InsertHistoryErrorState extends HistoryState {}

class DeleteHistoryLoadingState extends HistoryState {}

class DeleteHistorySuccessState extends HistoryState {}

class DeleteHistoryErrorState extends HistoryState {}
