import 'package:base_architecture/translations/languages/english_us.dart';
import 'package:base_architecture/translations/languages/french.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Translation {
  final Locale locale;
  Translation(this.locale);

  static Translation? of(BuildContext context){
    return Localizations.of<Translation>(context, Translation);
  }

  String translate(String key){
    return _langData[locale.languageCode]?[key] ?? key;
  }

  static Map<String, Map<String, String>> get _langData => {
    'en' : enUS,
    'fr' : frFR
  };

  static List<String> languages() => _langData.keys.toList();

  static Locale get english => const Locale("en","US");
  static Locale get french => const Locale("fr","FR");
}

class TranslationDelegate extends LocalizationsDelegate<Translation>{
  @override
  bool isSupported(Locale locale) {
    return Translation.languages().contains(locale.languageCode);
  }

  @override
  Future<Translation> load(Locale locale) {
    return SynchronousFuture<Translation>(Translation(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Translation> old) {
    return false;
  }

}