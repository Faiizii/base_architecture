
import 'package:base_architecture/providers/dark_theme_provider.dart';
import 'package:base_architecture/providers/test_provider.dart';
import 'package:base_architecture/translations/translation_config.dart';
import 'package:base_architecture/utils/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatelessWidget{
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>TestProvider())
      ],
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
        title: const Text("Providers"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<TestProvider>().increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Column(children: [
        Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children: <Widget>[
          TextButton(onPressed: (){
            Provider.of<DarkThemeProvider>(context,listen: false).updateLocale(Translation.english);
          }, child: const Text('Change to English')),
          TextButton(onPressed: (){
            Provider.of<DarkThemeProvider>(context,listen: false).updateLocale(Translation.english);
          }, child: const Text('Change to French'))
        ],),
        Expanded(child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Translation.of(context)?.translate(StringConstants.homeTest) ?? 'no_translation',
                style: Theme.of(context).textTheme.caption,
              ),
              const CountText(),
            ],
          ),
        ),),
      ],),
    );
  }

}
class CountText extends StatelessWidget{
  const CountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        '${context.watch<TestProvider>().count}',
        style: Theme.of(context)
            .textTheme
            .headline4
    );
  }

}