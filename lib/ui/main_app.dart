

import 'package:base_architecture/providers/dark_theme_provider.dart';
import 'package:base_architecture/themes/theme_helper.dart';
import 'package:base_architecture/translations/translation_config.dart';
import 'package:base_architecture/ui/components/drawer_component.dart';
import 'package:base_architecture/ui/screens/temp_screen/provider_screen.dart';
import 'package:base_architecture/ui/screens/temp_screen/typography_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DarkThemeProvider>(
      create: (_){
        var provider = DarkThemeProvider();
        provider.init();
        return provider;
      },
      child: Builder(
        builder: (context) {
          final themeMode = Provider.of<DarkThemeProvider>(context);
          return MaterialApp(
            title: 'Base Architecture',
            theme: ThemeHelper.lightTheme,
            darkTheme: ThemeHelper.darkTheme,
            themeMode: themeMode.mode,
            locale: TranslationConfig.english, //default language
            home: const MyHomePage(title: 'Base Architecture'),
          );
        }
      ),
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

  @override
  Widget build(BuildContext context) {
    return DrawerComponent(
      title: widget.title,
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 200,
            child: ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TypographyScreen()));
            }, child: const Text("Typography")),
          ),
          const SizedBox(height: 4,),
          SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProviderScreen()));
                  }, child: const Text("Provider ~8k likes"))
          ),
          const SizedBox(height: 4,),
        ],),
      ),
    );
  }
}