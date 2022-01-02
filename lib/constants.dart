import 'package:flutter_flu/screens/About.dart';
import 'package:flutter_flu/screens/authentification.dart';
import 'package:flutter_flu/screens/setting.dart';
import 'package:get/get.dart';

Map<String, dynamic> items = {
  "Synchroniser vos journaux": Authentification(),
  "Parametre": AppSetting(),
  "A propos": AppAbout(),
};
