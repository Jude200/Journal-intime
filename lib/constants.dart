import 'package:flutter/material.dart';
import 'package:flutter_flu/screens/About.dart';
import 'package:flutter_flu/screens/authentification.dart';
import 'package:flutter_flu/screens/setting.dart';

class AppColor {
  Color mainColor = const Color(0xFF696b9e);
  Color ePColor = const Color(0xFF696b9e);
}

AppColor appColor = AppColor();

Map<String, dynamic> items = {
  "Synchroniser vos journaux": Authentification(),
  "Parametre": AppSetting(),
  "A propos": Apropospage(),
};
