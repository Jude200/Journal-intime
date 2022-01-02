import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flu/models/appData.dart';
import 'package:flutter_flu/screens/password_page.dart';
import 'package:flutter_flu/services/sqfliteSettingData.dart';
import 'package:get/get.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({Key key}) : super(key: key);

  @override
  _AppSettingState createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  SqfLiteSettingData _sqfLiteSettingData = SqfLiteSettingData();
  AppData appData;
  List<AppData> b;
  double sliderInitvalue = 0.5;
  bool switchValueMode = false;
  bool switchValuePassword = false;

  Future<void> getDataSetting() async {
    AppData a = await _sqfLiteSettingData.getData(1);

    setState(() {
      appData = a;
      switchValueMode = appData.darkMode;
      switchValuePassword = appData.islock;
    });
  }

  @override
  void initState() {
    getDataSetting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  backgroundColor: backgroundcolor2,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            Container(
                margin: EdgeInsets.all(15),
                child: Text("Paramètre", style: TextStyle(fontSize: 30))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mode Nuit",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Switch(
                    value: switchValueMode,
                    onChanged: (i) async {
                      setState(() {
                        switchValueMode = i;
                        appData.darkMode = i;
                      });
                      Get.changeTheme(
                          !i ? ThemeData.light() : ThemeData.dark());
                      await _sqfLiteSettingData.update(appData);
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mot de passe",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Switch(
                    value: switchValuePassword,
                    onChanged: (i) async {
                      setState(() {
                        switchValuePassword = i;
                        appData.islock = i;
                      });
                      if (i == true && appData.password == null) {
                        Get.to(() => Passwordpage());
                      }
                      await _sqfLiteSettingData.update(appData);
                    }),
              ],
            ),
            Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () async {
                    print(appData.password);
                    if (appData.islock) {
                      Get.to(() => Passwordpage(ischange: true));
                    }
                  },
                  child: Text("Changer le mot de passe",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              appData.islock == false ? Colors.black54 : null)),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
