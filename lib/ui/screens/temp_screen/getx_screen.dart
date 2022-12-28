import 'package:base_architecture/state_management/getx/test_controller.dart';
import 'package:base_architecture/translations/translation_config.dart';
import 'package:base_architecture/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXScreen extends GetView<TestController>{
  const GetXScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){controller.counter++;},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Column(children: [
        Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children: <Widget>[
          TextButton(onPressed: (){
            Get.updateLocale(TranslationConfig.english);
          }, child: const Text('Change to English')),
          TextButton(onPressed: (){
            Get.updateLocale(TranslationConfig.french);
          }, child: const Text('Change to French'))
        ],),
        Expanded(child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                StringConstants.homeTest.tr,
                style: Theme.of(context).textTheme.caption,
              ),
              ObxValue((RxInt rx){
                return Text(
                    '${rx.value}',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                );
              }, controller.counter)

            ],
          ),
        ),),
      ],),
    );
  }

}