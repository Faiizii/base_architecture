import 'dart:io';
import 'package:base_architecture/ui/main_app.dart';
import 'package:base_architecture/flogs/crashlytics.dart';
import 'package:base_architecture/flogs/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  FirebaseCrashlytics? crashlytics;
  if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      crashlytics = FirebaseCrashlytics.instance;
    } catch (e) {
      debugPrint("Firebase couldn't be initialized: $e");
    }
  }
  await guardWithCrashlytics(
      guardedMain, //this is actually the launching method having all essentials initializations of package,libs etc.
      crashlytics: crashlytics,
  );
}

/// Without logging and crash reporting, this would be `void main()`.
void guardedMain() {
  // We ensure Flutter binding is initialized here. Otherwise, calls to
  // SystemChrome will not work, for example. This is a no-op if the binding
  // is already initialized.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  runApp(const MyApp(),);
}
