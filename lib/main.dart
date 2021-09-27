import 'package:flutter/material.dart';
import 'package:flutter_flu/widgets/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
