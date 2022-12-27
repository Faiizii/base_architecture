//implemented https://pub.dev/packages/hive
//as it is most like package on pub.dev. on second number is sqf lite.
//get storage is not a database. so not including that in comparison.
// get storage can be an alternative to shared preference.

import 'package:base_architecture/database/test_model.dart';
import 'package:hive/hive.dart';

class DbConfig {

  void saveTestModel(TestModel model) async {
    var box = await Hive.openBox("test_models");
    box.put(model.name, model);
    await box.close();
  }

  Future<TestModel> getTestModel(String name) async {
    var box = await Hive.openBox("test_models");
    return box.get(name);
  }

}