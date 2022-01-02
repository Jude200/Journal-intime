import 'package:flutter/cupertino.dart';

class AppData {
  int id;
  bool darkMode;
  String police;
  bool islock;
  String password;
  String passwordIndicator;

  AppData(
      {this.id,
      @required this.darkMode,
      @required this.police,
      @required this.islock,
      @required this.password,
      @required this.passwordIndicator});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "darkMode": darkMode ? 1 : 0,
      "police": police,
      "islock": islock ? 1 : 0,
      "password": password,
      "passwordIndicator": passwordIndicator
    };
  }

  factory AppData.fromMap(Map<String, dynamic> map) {
    return AppData(
        id: map["id"],
        darkMode: map["darkMode"] == 1 ? true : false,
        police: map["police"],
        islock: map["islock"] == 1 ? true : false,
        password: map["password"],
        passwordIndicator: map["passwordIndicator"]);
  }
}
