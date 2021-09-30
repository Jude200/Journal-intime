import 'package:flutter_flu/models/appData.dart';
import 'package:flutter_flu/services/sqfliteSettingData.dart';

Future<void> initializeApp(AppData a) async {
  SqfLiteSettingData sqfLiteSettingData = SqfLiteSettingData();
  a = await sqfLiteSettingData.getData(1);
  if (a == null) {
    a = AppData(darkMode: false, police: null, fontSize: null, islock: false);
    await sqfLiteSettingData.insert(a);
  }
}
