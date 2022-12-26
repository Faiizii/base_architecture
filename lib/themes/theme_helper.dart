import 'package:flutter/material.dart';


class ThemeHelper {

  static final ThemeData darkTheme = ThemeData(
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
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