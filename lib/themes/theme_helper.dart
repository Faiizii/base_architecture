import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThemeHelper {

  static final ThemeData darkTheme = ThemeData(
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
    useMaterial3: true,
    textTheme: Typography().white.copyWith(
      caption: Get.textTheme.caption?.copyWith(color: Colors.red)
    ),
    errorColor: Colors.red,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.red,
      surface: Colors.red
    ),
  );


  static final ThemeData lightTheme = ThemeData(
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ),
      colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.green,
      )
  );
}