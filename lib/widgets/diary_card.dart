import 'package:flutter/material.dart';
import 'package:flutter_flu/models/diary.dart';
import 'package:flutter_flu/screens/modifyDiary.dart';
import 'package:flutter_flu/services/sqflite_gestionAppData.dart';
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
            Icon(Icons.delete_outline, color: Colors.white),
            Text("Supprimer"),
          ],
        ),
      ),
      confirmDismiss: (i) {
        return Get.defaultDialog(
            textConfirm: "Oui",
            textCancel: "Non",
            middleText: "Voulez-vous supprimer cet article ?",
            onConfirm: () {},
            onCancel: () {});
      },
      key: Key(widget.diary.titre),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Authentification(diary: widget.diary)));
          },
          child: Card(
            elevation: 05.5,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    child: CircleAvatar(
                        backgroundImage: AssetImage(widget.diary.image),
                        radius: 30),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(widget.diary.titre,
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 08),
                          child: Container(
                              child: Text(widget.diary.body, maxLines: 1)),
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
