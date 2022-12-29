import 'package:base_architecture/themes/theme_helper.dart';
import 'package:base_architecture/translations/translation_config.dart';
import 'package:base_architecture/ui/screens/temp_screen/bloc_screen.dart';
import 'package:base_architecture/ui/screens/temp_screen/getx_screen.dart';
import 'package:base_architecture/ui/screens/temp_screen/provider_screen.dart';
import 'package:base_architecture/ui/screens/temp_screen/typography_screen.dart';
import 'package:base_architecture/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  //ensure initializing bindings here
  //initialize strip, hive, firebase here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( //if you don't want to use GETx, replace GetMaterialApp with MaterialApp
      title: 'Base Architecture',
      theme: ThemeHelper.lightTheme,
      darkTheme: ThemeHelper.darkTheme,
      themeMode: ThemeMode.system,
      translations: TranslationConfig(),
      fallbackLocale: TranslationConfig.english, //select default language when no translation found in the targeted language files
      locale: TranslationConfig.english, //default language
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

  bool isDark = Get.isDarkMode;
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
              Get.to(() => const TypographyScreen());
            }, child: const Text("Typography")),
          ),
          const SizedBox(height: 4,),
          SizedBox(
            width: 200,
            child: ElevatedButton(onPressed: () {
              Get.to(() => const GetXScreen());
            }, child: const Text("GetX 10k+ Likes")),
          ),
          const SizedBox(height: 4,),
          SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=> const ProviderScreen());
                  }, child: const Text("Provider ~8k likes"))
          ),
          const SizedBox(height: 4,),
          SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=> const BlocScreen());
                  }, child: const Text("BLoC ~5k likes"))
          ),
        ],),
      ),
    );
  }
}
