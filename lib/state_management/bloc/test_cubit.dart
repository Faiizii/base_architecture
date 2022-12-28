import 'package:bloc/bloc.dart';

class TestCubit extends Cubit<int>{
  TestCubit():super(0);
  void increment() => emit(state+1);
}