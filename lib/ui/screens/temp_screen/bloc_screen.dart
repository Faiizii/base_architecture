import 'package:base_architecture/state_management/bloc/test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatelessWidget{
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>TestCubit(),
      child: const ContentView(),
    );
  }
}
class ContentView extends StatelessWidget{
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLoC"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<TestCubit>().increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Column(children: [
        Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children: <Widget>[
          TextButton(onPressed: (){
            // Get.updateLocale(TranslationConfig.english);
          }, child: const Text('Change to English')),
          TextButton(onPressed: (){
            // Get.updateLocale(TranslationConfig.french);
          }, child: const Text('Change to French'))
        ],),
        Expanded(child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'StringConstants.homeTest.tr',
                style: Theme.of(context).textTheme.caption,
              ),
              BlocBuilder<TestCubit,int>(builder: (context, state) {
                return Text(
                    '$state',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                );
              },)
            ],
          ),
        ),),
      ],),
    );
  }

}