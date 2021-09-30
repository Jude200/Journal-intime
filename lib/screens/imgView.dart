import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_flu/models/diary.dart';

class ImgView extends StatelessWidget {
  final Diary diary;
  const ImgView({Key key, @required this.diary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Hero(tag: diary.date, child: Image.file(File(diary.image)))],
      ),
    );
  }
}
