import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flu/models/appData.dart';
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
  static const policeTheme = [
    "Acme",
    "Barrio",
    "Aguafina_Script",
    "Pinyon_Script",
    "Pirata_One"
  ];

  List<ListTile> _policeThemeListTile = policeTheme
      .map((e) => ListTile(
          onTap: () {},
          subtitle: Text(e),
          title: Text(
            e,
            style: TextStyle(fontFamily: e),
          )))
      .toList();
  Future<void> getDataSetting() async {
    AppData a = await _sqfLiteSettingData.getData(1);
    b = await _sqfLiteSettingData.getAllDiary();
    setState(() {
      appData = a;
      sliderInitvalue = appData.fontSize / 100;
      switchValueMode = appData.darkMode;
      switchValuePassword = appData.islock;
      print(appData.darkMode);
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
            ExpansionTile(
              title: Text(
                "Police",
                //  style: TextStyle(color: Colors.white),
              ),
              children: _policeThemeListTile,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Taille", style: TextStyle(fontWeight: FontWeight.bold)),
                Slider(
                    value: sliderInitvalue,
                    divisions: 100,
                    label: "${(sliderInitvalue * 100).toInt()}",
                    onChangeEnd: (i) async {
                      appData.fontSize = (100 * i).toInt();
                      await _sqfLiteSettingData.update(appData);
                    },
                    onChanged: (i) {
                      setState(() {
                        sliderInitvalue = i;
                      });
                    }),
              ],
            ),
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
                      Get.changeTheme(Get.isDarkMode
                          ? ThemeData.light()
                          : ThemeData.dark());
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
                      await _sqfLiteSettingData.update(appData);
                    }),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
