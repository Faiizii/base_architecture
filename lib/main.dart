import 'package:base_architecture/themes/theme_helper.dart';
import 'package:base_architecture/translations/translation_config.dart';
import 'package:base_architecture/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Base Architecture',
      theme: ThemeHelper.lightTheme,
      darkTheme: ThemeHelper.darkTheme,
      themeMode: ThemeMode.system,
      translations: TranslationConfig(),
      fallbackLocale: TranslationConfig.english, //select default language
      locale: TranslationConfig.english,
      home: const MyHomePage(title: 'Base Architecture'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Switch(
            value: isDark,
            inactiveThumbImage: Image.asset("assets/moon.png",width: 48,).image,
            activeThumbImage: Image.asset("assets/sun.png",width: 48,).image,
            inactiveThumbColor: Colors.transparent,
            activeColor: Colors.transparent,
            onChanged: (bool value) {
              if (value) {
                Get.changeThemeMode(ThemeMode.dark);
              } else {
                Get.changeThemeMode(ThemeMode.light);
              }
              setState(() {
                isDark = value;
              });
            },)
        ],
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
              Text(
                '$_counter',
                style: Theme.of(context)
                    .textTheme
                    .headline4
              ),
            ],
          ),
        ),),
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
