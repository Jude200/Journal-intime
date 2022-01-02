import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flu/models/diary.dart';
import 'package:flutter_flu/screens/modifyDiary.dart';
import 'package:flutter_flu/services/sqflite_helperDiary.dart';
import 'package:get/get.dart';

class DiaryCard extends StatefulWidget {
  final Diary diary;
  DiaryCard({
    Key key,
    @required this.diary,
  }) : super(key: key);

  @override
  State<DiaryCard> createState() => _DiaryCardState();
}

class _DiaryCardState extends State<DiaryCard> {
  SqfLiteDiaryData sqfLiteDiaryData = SqfLiteDiaryData();

  Future<void> deleteDiary() async {
    await sqfLiteDiaryData.delete(widget.diary.id);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
        child: Row(
          children: [
            SizedBox(width: 20),
            Icon(Icons.delete_outline, color: Colors.white, size: 30),
            Text("Supprimer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      secondaryBackground: Container(color: Colors.transparent),
      confirmDismiss: (direction) async {
        bool res = false;
        if (direction == DismissDirection.startToEnd) {
          await Get.defaultDialog(
              onConfirm: () async {
                await sqfLiteDiaryData.delete(widget.diary.id);
                res = true;
                Get.back();
              },
              middleText: "Voulez-vous supprimer ce journal ?",
              textConfirm: "Supprimer",
              textCancel: "Annuler",
              buttonColor: Colors.transparent,
              confirmTextColor: Colors.green);
        }
        return res;
      },
      key: Key(widget.diary.titre),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {
            Get.to(() => Authentification(diary: widget.diary));
          },
          child: Card(
            elevation: 05.5,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  if (widget.diary.image != null)
                    Container(
                      width: 70,
                      height: 70,
                      child: Hero(
                          child: Image.file(File(widget.diary.image)),
                          tag: widget.diary.date),
                    ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(widget.diary.titre,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 08),
                          child: Container(
                              child: Text(widget.diary.body,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis)),
                        ),
                        Container(child: Text(widget.diary.date)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
