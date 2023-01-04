import 'package:base_architecture/translations/languages/english_us.dart';
import 'package:base_architecture/translations/languages/french.dart';
import 'package:flutter/material.dart';

class TranslationConfig {

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : enUS,
    'fr_FR' : frFR
  };

  static Locale get english => const Locale("en","US");
  static Locale get french => const Locale("fr","FR");
}