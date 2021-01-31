import 'package:flutter/material.dart';
import 'package:scooter_info/views/listDevices.view.dart';

void main() {
  runApp(
    MyApp()
  );
}


class MyApp extends StatelessWidget {
  MyApp({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListDevices(),
    );
  }
}