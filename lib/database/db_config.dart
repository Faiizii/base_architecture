//implemented https://pub.dev/packages/hive
//as it is most like package on pub.dev. on second number is sqf lite.
//get storage is not a database. so not including that in comparison.
// get storage can be an alternative to shared preference.

import 'package:base_architecture/database/models/test_model.dart';
import 'package:hive/hive.dart';

class DbConfig {

  Future<void> saveTestModel(TestModel model) async {
    var box = await Hive.openBox<TestModel>("test_models");
    box.put(model.name, model); //here id is [model.name]'s value
    //use add function for auto increment of index/id.
    await box.close();
  }

  Future<TestModel?> getTestModel(String name) async {
    var box = await Hive.openBox<TestModel>("test_models");
    TestModel? model = box.get(name);
    box.close();
    return model;
  }

}