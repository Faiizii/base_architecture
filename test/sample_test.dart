import 'dart:math';

import 'package:base_architecture/database/models/test_model.dart';
import 'package:base_architecture/database/models/test_model.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main(){
  late TestModel model;
  setUp((){
    model = MockTestModel();
  });
  test("testing initial state",(){
    when(model.name).thenReturn("Faiizii");

    expect(model.name, "Faiizii");


    when(model.age).thenReturn(25);
    expect(model.age, 25);
    expect(model.age, greaterThan(0));
    verify(model.age).called(equals(2));
  });
}