
import 'package:flutter/foundation.dart';

class TestProvider with ChangeNotifier, DiagnosticableTreeMixin{
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}