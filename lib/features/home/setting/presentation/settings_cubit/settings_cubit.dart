import 'package:animeacheck/core/cache_helper/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/service_locator.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool isArabicEnable = false;
  bool isDarkThemEnable = false;
  bool isNotificationEnable = false;
  bool isLocationEnable = false;

  changeCurrentLanguage(bool value) async{
    isArabicEnable = value;
    await sl<CacheHelper>().saveData(
    key: "isArabicEnable",
    value: isArabicEnable);
    emit(ChangeCurrentLanguageState());
  }

  void getLang() async{
    isArabicEnable= await sl<CacheHelper>().getData(key: "isArabicEnable");
    emit(GetLangState());
  }


  changeNotification(bool value) {
    isNotificationEnable = value;
    emit(ChangeNotificationState());
  }

  changeThem(bool value) async{
    isDarkThemEnable = value;
    await sl<CacheHelper>().saveData(
        key: "isDarkThemEnable",
        value: isDarkThemEnable);
    emit(ChangeThemState());
  }

  void getThem() async{
    isDarkThemEnable= await sl<CacheHelper>().getData(key: "isDarkThemEnable");
    emit(GetThemState());
  }

  changeLocation(bool value) {
    isLocationEnable = value;
    emit(ChangeLocationState());
  }


}
