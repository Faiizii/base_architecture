import 'dart:io';

import 'package:base_architecture/dart_core/global_functions/utils_global_function.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationManager {
  static final NotificationManager _instance = NotificationManager._();
  NotificationManager._();
  factory NotificationManager() => _instance;

  FirebaseMessaging? _messaging;

  Future<void> init() async {
    _messaging = FirebaseMessaging.instance;

    if (Platform.isIOS) {
      _messaging!.requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: true,
          criticalAlert: true,
          provisional: true,
          sound: true
      );
    }

    _messaging!.onTokenRefresh.listen(_handleUpdatedToken);

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage); //its handler should be a top level function so it is in utils_global_function.dart file.
    FirebaseMessaging.onMessageOpenedApp.listen(_handleAppOpeningFromNotification);
  }

  Future<String?> get fcmToken async {
    assert(_messaging != null,"make sure you have called init() method in main before accessing Notification Manager");
    return await _messaging!.getToken();
  }

  void _handleUpdatedToken(String token){
    //handle token here
  }

  //will be called when application is running
  void _handleForegroundMessage(RemoteMessage message) {
    //handle message
  }

  //will be called when application is launched from the notification click from notification panel.
  void _handleAppOpeningFromNotification(RemoteMessage message) {
    //handle message
  }

  //NOTE: use flutter location notification plugin for creating notifications UI
}