import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flu/models/appData.dart';
import 'package:flutter_flu/screens/password_page.dart';
import 'package:flutter_flu/services/sqfliteSettingData.dart';
import 'package:flutter_flu/widgets/home.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppData setting = await fetchConfigData();
  runApp(GetMaterialApp(
    title: "Life Diary",
    theme: ThemeData(fontFamily: "Montserrat"),
    themeMode: setting.darkMode ? ThemeMode.dark : ThemeMode.light,
    debugShowCheckedModeBanner: false,
    home: setting.islock ? Passwordpage() : Home(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

Future fetchConfigData() async {
  AppData a;
  SqfLiteSettingData sqfLiteSettingData = SqfLiteSettingData();
  a = await sqfLiteSettingData.getData(1);

  if (a == null) {
    a = AppData(
        darkMode: false,
        police: "Normal",
        islock: false,
        password: null,
        passwordIndicator: null);
    await sqfLiteSettingData.insert(a);
  }
  Get.changeTheme(!a.darkMode ? ThemeData.light() : ThemeData.dark());

  return a;
}
