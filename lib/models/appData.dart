import 'package:flutter/cupertino.dart';

class AppData {
  int id;
  int backgroundColor;
  String police;
  int fontSize;
  bool islock;

  AppData({
    this.id,
    @required this.backgroundColor,
    @required this.police,
    @required this.fontSize,
    @required this.islock,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "backgroundColor": backgroundColor,
      "police": police,
      "fontSize": fontSize,
      "is": islock ? 1 : 0,
    };
  }

  factory AppData.fromMap(Map<String, dynamic> map) {
    return AppData(
      backgroundColor: map["backgroundColor"],
      police: map["police"],
      fontSize: map["fontWeight"],
      islock: map["islock"] == 1 ? true : false,
    );
  }
}
