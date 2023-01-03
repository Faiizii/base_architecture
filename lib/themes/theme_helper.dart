import 'package:base_architecture/ui/design_system/text.dart';
import 'package:flutter/material.dart';


class ThemeHelper {

  static final ThemeData darkTheme = ThemeData(
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
    useMaterial3: true,
    textTheme: Typography().white.copyWith(
      titleLarge: MyTopography.titleLarge,
      titleMedium: MyTopography.titleMedium,
    ),
    errorColor: Colors.red,
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(
      foregroundColor: Colors.orange,
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      disabledForegroundColor: Colors.white70,
      backgroundColor: Colors.orange,
        disabledBackgroundColor: Colors.white54

    )),
    cardTheme: const CardTheme(
      elevation: 6,
      shadowColor: Colors.blue,
      color: Colors.black87,
      surfaceTintColor: Colors.blue,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      shadowColor: Colors.blue,
      elevation: 6,
      centerTitle: false,
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.red
    ),
  );

  static final ThemeData lightTheme = ThemeData(
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white
      )),
      cardTheme: const CardTheme(
        elevation: 6,
        color: Colors.white,
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.green,
      )
  );

  static final ThemeData purpleTheme = ThemeData(
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.purple,
        disabledColor: Colors.grey,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple
      )),
      cardTheme: const CardTheme(
        elevation: 6,
        shadowColor: Colors.purple,
        color: Colors.white,
      ),
      colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.purple,
      )
  );
}