import 'package:base_architecture/themes/theme_helper.dart';
import 'package:base_architecture/translations/translation_config.dart';
import 'package:base_architecture/ui/screens/temp_screen/getx_screen.dart';
import 'package:base_architecture/utils/image_constants.dart';
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

  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Switch(
            value: isDark,
            inactiveThumbImage: Image
                .asset(ImageConstants.moonImage, width: 48,)
                .image,
            activeThumbImage: Image
                .asset(ImageConstants.sunImage, width: 48,)
                .image,
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
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 200,
            child: ElevatedButton(onPressed: () {
              Get.to(() => const GetXScreen());
            }, child: Text("GetX")),
          ),
          SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {}, child: Text("BLoC"))),
          SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Provider"))),
        ],),
      ),
    );
  }
}
