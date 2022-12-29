import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTopography {
  //same as define others
  static TextStyle? get titleLarge => Get.textTheme.titleLarge?.copyWith(
      color: Colors.amber,
    //define fonts, size etc
  );
  static TextStyle? get titleMedium => Get.textTheme.titleMedium?.copyWith(
    color: Colors.amber.shade100,
    //define fonts, size etc
  );
}