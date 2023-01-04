import 'package:base_architecture/managers/preference_manager.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider extends ChangeNotifier{
  final PreferenceManager _instance = PreferenceManager();

  ThemeMode _mode = ThemeMode.light;
  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;

  void init() async {
    await _instance.initialize();
    _mode = _instance.getDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void updateTheme(ThemeMode mode) {
    _instance.saveDarkMode(mode == ThemeMode.dark);
    _mode = mode;
    notifyListeners();
  }

}