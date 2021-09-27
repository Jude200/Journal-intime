import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Diary {
  String body;
  String date;
  int id;
  String image;
  String titre;
  Diary({
    this.id,
    @required this.titre,
    @required this.body,
    @required this.date,
    @required this.image,
  });

  factory Diary.fromJson(String source) => Diary.fromMap(json.decode(source));

  factory Diary.fromMap(Map<String, dynamic> map) {
    return Diary(
      id: map['id'],
      titre: map['titre'],
      body: map['body'],
      date: map['date'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'body': body,
      'date': date,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
}
