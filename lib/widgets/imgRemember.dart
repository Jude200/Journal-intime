import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flu/models/diary.dart';
import 'package:flutter_flu/screens/imgView.dart';
import 'package:get/route_manager.dart';

class ImgRemember extends StatelessWidget {
  final Diary diary;
  const ImgRemember({Key key, @required this.diary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () => Get.to(() => ImgView(diary: diary)),
              child: Hero(
                  tag: diary.date,
                  child:
                      Image.file(File(diary.image), width: 200, height: 150))),
          SizedBox(height: 10),
          Text(diary.date, style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
