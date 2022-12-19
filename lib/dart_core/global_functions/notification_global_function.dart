import 'dart:developer';

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