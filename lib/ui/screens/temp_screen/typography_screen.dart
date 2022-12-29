import 'package:flutter/material.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Typography"),
      ),
      body: Column(mainAxisAlignment:MainAxisAlignment.spaceAround,children: [
        Row(children: [
          Expanded(flex:2,child: Column(children: [
            Text("Display large",style: Theme.of(context).textTheme.displayLarge,),
            Text("Display medium",style: Theme.of(context).textTheme.displayMedium,),
            Text("Display small",style: Theme.of(context).textTheme.displaySmall,),
          ],)),
          Expanded(flex:1,child: Column(children: [
            Text("Headline large",style: Theme.of(context).textTheme.headlineLarge,),
            Text("Headline medium",style: Theme.of(context).textTheme.headlineMedium,),
            Text("Headline small",style: Theme.of(context).textTheme.headlineSmall,),
          ],)),
        ],),
        const Divider(),
        Row(children: [
          Expanded(child: Column(children: [
            Text("Title large",style: Theme.of(context).textTheme.titleLarge,),
            Text("Title medium",style: Theme.of(context).textTheme.titleMedium,),
            Text("Title small",style: Theme.of(context).textTheme.titleSmall,),
          ],)),
          Expanded(child: Column(children: [
            Text("Body large",style: Theme.of(context).textTheme.bodyLarge,),
            Text("Body medium",style: Theme.of(context).textTheme.bodyMedium,),
            Text("Body small",style: Theme.of(context).textTheme.bodySmall,),
          ],)),
        ],),
        const Divider(),
        Column(children: [
          Text("Label large",style: Theme.of(context).textTheme.labelLarge,),
          Text("Label medium",style: Theme.of(context).textTheme.labelMedium,),
          Text("Label small",style: Theme.of(context).textTheme.labelSmall,),
        ],)
      ],),
    );
  }
}
