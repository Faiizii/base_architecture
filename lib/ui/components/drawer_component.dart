import 'package:base_architecture/ui/design_system/circlular_image.dart';
import 'package:base_architecture/utils/image_constants.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  final Widget body;
  final String title;
  const DrawerComponent({Key? key, required this.body, this.title = ""}) : super(key: key);

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
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
              // if (value) {
              //   Get.changeThemeMode(ThemeMode.dark);
              // } else {
              //   Get.changeThemeMode(ThemeMode.light);
              // }
              setState(() {
                isDark = value;
              });
            },)
        ],
      ),
      drawer: Drawer(child: SafeArea(
        child: Column(children: const <Widget>[
          DrawerHeader(child: Center(child: CircularNetworkImage(url: "https://picsum.photos/2048"),)),
          Text("Home"),
        ],),
      ),),
      body: widget.body
    );
  }
}
