import 'package:base_architecture/database/db_config.dart';
import 'package:base_architecture/database/models/test_model.dart';

class TestRepo {
  final DbConfig _db = DbConfig();
  Future<TestModel?> getTestModel({bool isCache = false, bool isNetwork = false}) async {
    // get the test model from the server and save it in the local db
    //or serve the model to UI after fetching
    if(isNetwork) {
      //fetch from network
      TestModel model = TestModel(
          name: "Faiizii", age: 28, friends: ["A", "B", "C"]);
      if (isCache) {
        await _db.saveTestModel(model);
      }
      return model;
    } else {
      //serve the recent from th local db
      //get by key or get by index depend upon on use case
      // TestModel? temp = await _db.getTestModelByIndex(0);
      TestModel? temp = await _db.getTestModel("Faiizii");
      return temp;
    }
  }

}