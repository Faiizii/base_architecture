import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

void printLog(dynamic value){
  if(kDebugMode){
    if(value is String){
      log(value);
    }else{
      print(value);
    }
  }
}

//it will be called when app is in background or not running/terminated
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  //handle message
}