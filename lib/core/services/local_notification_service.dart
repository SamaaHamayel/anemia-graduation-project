import 'dart:async';
import 'dart:developer';
import 'package:animeacheck/features/home/medicine/domain/medicine_model/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
  StreamController();
  static onTap(NotificationResponse notificationResponse) {
     log(notificationResponse.id!.toString());
     log(notificationResponse.payload!.toString());
    streamController.add(notificationResponse);
    // Navigator.push(context, route);
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //basic Notification
  static void showBasicNotification() async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
        'id 1', 'basic notification',
        importance: Importance.max,
        priority: Priority.high,
        sound:
        RawResourceAndroidNotificationSound('sound.wav'.split('.').first));
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Baisc Notification',
      'body',
      details,
      payload: "Payload Data",
    );
  }

  //basic Notification2
  static void showBasicNotification2() async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
        'id 3', 'basic notification1',
        importance: Importance.max,
        priority: Priority.high,
        sound:
        RawResourceAndroidNotificationSound('sound.wav'.split('.').first));
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
      4,
      'Basic Notification',
      'body',
      details,
      payload: "Payload Data",
    );
  }

  //showRepeatedNotification
  static void showRepeatedNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'id 2',
      'repeated notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = const NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Reapated Notification',
      'body',
      RepeatInterval.daily,
      details,
      payload: "Payload Data",
    );
  }

  //showSchduledNotification
  static void showSchduledNotification(
       {
         required DateTime currentDate,
         required TimeOfDay schduledTime,
         required MedicineModel medicineModel
     }
      ) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'schduled notification',
      'id 3',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = const NotificationDetails(
      android: android,
    );
    tz.initializeTimeZones();
    log(tz.local.name);
    log("Before ${tz.TZDateTime.now(tz.local).hour}");
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    log(currentTimeZone);
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    log(tz.local.name);
    log("After ${tz.TZDateTime.now(tz.local).hour}");
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      medicineModel.medicineName,
      medicineModel.medicineDose.toString(),
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      tz.TZDateTime(
        tz.local,
        currentDate.year,
        currentDate.month,
        currentDate.day,
        schduledTime.hour,
        schduledTime.minute,
      ).subtract(const Duration(minutes: 1)),
      details,
      payload: 'Medicine Name: ${medicineModel.medicineName} ,'
          'Medicine Dose: ${medicineModel.medicineDose}' ,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  //showDailySchduledNotification
  static void showDailySchduledNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'daily schduled notification',
      'id 4',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = const NotificationDetails(
      android: android,
    );
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    var currentTime = tz.TZDateTime.now(tz.local);
    log("currentTime.year:${currentTime.year}");
    log("currentTime.month:${currentTime.month}");
    log("currentTime.day:${currentTime.day}");
    log("currentTime.hour:${currentTime.hour}");
    log("currentTime.minute:${currentTime.minute}");
    log("currentTime.second:${currentTime.second}");
    var scheduleTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      21,
    );
    log("scheduledTime.year:${scheduleTime.year}");
    log("scheduledTime.month:${scheduleTime.month}");
    log("scheduledTime.day:${scheduleTime.day}");
    log("scheduledTime.hour:${scheduleTime.hour}");
    log("scheduledTime.minute:${scheduleTime.minute}");
    log("scheduledTime.second:${scheduleTime.second}");
    if (scheduleTime.isBefore(currentTime)) {
      scheduleTime = scheduleTime.add(const Duration(days: 1));
      log("AfterAddedscheduledTime.year:${scheduleTime.year}");
      log("AfterAddedscheduledTime.month:${scheduleTime.month}");
      log("AfterAddedscheduledTime.day:${scheduleTime.day}");
      log("AfterAddedscheduledTime.hour:${scheduleTime.hour}");
      log("AfterAddedscheduledTime.minute:${scheduleTime.minute}");
      log("AfterAddedscheduledTime.second:${scheduleTime.second}");
      log('Added Duration to scheduled time');
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      'Enter your Medicine for tomorrow',
      'Have a productive day',
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      scheduleTime,
      details,
      payload: 'zonedSchedule',
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}

