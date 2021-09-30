import 'package:flutter/cupertino.dart';

class AppData {
  int id;
  bool darkMode;
  String police;
  int fontSize;
  bool islock;

  AppData({
    this.id,
    @required this.darkMode,
    @required this.police,
    @required this.fontSize,
    @required this.islock,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "darkMode": darkMode ? 1 : 0,
      "police": police,
      "fontSize": fontSize,
      "islock": islock ? 1 : 0,
    };
  }

  factory AppData.fromMap(Map<String, dynamic> map) {
    return AppData(
      id: map["id"],
      darkMode: map["darkMode"] == 1 ? true : false,
      police: map["police"],
      fontSize: map["fontSize"],
      islock: map["islock"] == 1 ? true : false,
    );
  }
}
