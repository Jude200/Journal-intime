import 'package:flutter/material.dart';
import 'package:flutter_flu/models/appData.dart';
import 'package:flutter_flu/services/sqfliteSettingData.dart';
import 'package:flutter_flu/widgets/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: "Life Diary",
    onInit: () async {
      bool darkMode;
      bool isLock;
      AppData a;
      SqfLiteSettingData sqfLiteSettingData = SqfLiteSettingData();
      a = await sqfLiteSettingData.getData(1);
      if (a == null) {
        a = AppData(
            darkMode: false, police: null, fontSize: null, islock: false);
        await sqfLiteSettingData.insert(a);
      }
      print(a.islock);
      print(a.fontSize);
      print(a.police);
      print(a.darkMode);
      darkMode = a.darkMode;
      isLock = a.islock;
    },
    theme: ThemeData(
      fontFamily: null,
    ),
    themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
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
