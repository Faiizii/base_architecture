
import 'package:flutter/material.dart';

class MyTopography {
  BuildContext context;
  MyTopography(this.context);
  //same as define others
  TextStyle? get titleLarge => Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Colors.amber,
    //define fonts, size etc
  );
  TextStyle? get titleMedium => Theme.of(context).textTheme.titleMedium?.copyWith(
    color: Colors.amber.shade100,
    //define fonts, size etc
  );
}