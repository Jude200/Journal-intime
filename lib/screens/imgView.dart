import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_flu/models/diary.dart';

class ImgView extends StatelessWidget {
  final Diary diary;
  const ImgView({Key key, @required this.diary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Hero(
              tag: diary.date,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image.file(File(diary.image)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      diary.titre,
                      maxLines: 2,
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ))),
    );
  }
}
