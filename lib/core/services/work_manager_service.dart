import 'package:workmanager/workmanager.dart';

import 'local_notification_service.dart';
// steps
//1.init work manager
//2.excute our medicine.
//3.register our task in work manager

class WorkManagerService {
  void registerMyMedicine() async {
    //register my medicine
    await Workmanager().registerPeriodicTask(
      'id1',
      'show simple notification',
      frequency: const Duration(hours: 12),
    );
  }

  //init work manager service
  Future<void> init() async {
    await Workmanager().initialize(
      actionTask,
      isInDebugMode: true,
    );
    registerMyMedicine();
  }

  void cancelTask(String id) {
    Workmanager().cancelAll();
  }
}

@pragma('vm-entry-point')
void actionTask() {
  //show notification
  Workmanager().executeTask((medicineModel, inputData) {
    LocalNotificationService.showDailySchduledNotification();
    return Future.value(true);
  });
}

//1.schedule notification at 9 pm.
//2.execute for this notification.