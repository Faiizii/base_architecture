import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<TestModel>()])

@HiveType(typeId: 1)
class TestModel extends HiveObject {
  TestModel({required this.name, required this.age, required this.friends});

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  List<String> friends;

  @override
  String toString() {
    return '$name: $age';
  }
}
