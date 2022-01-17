import 'package:flutter/material.dart';
import 'package:flutter_flu/models/diary.dart';
import 'package:flutter_flu/services/sqflite_helperDiary.dart';
import 'package:flutter_flu/widgets/imgRemember.dart';

class MyImgRemember extends StatefulWidget {
  final Diary diary;
  const MyImgRemember({Key key, this.diary}) : super(key: key);

  @override
  _MyImgRememberState createState() => _MyImgRememberState();
}

class _MyImgRememberState extends State<MyImgRemember> {
  SqfLiteDiaryData _sqfLiteDiaryData = SqfLiteDiaryData();
  bool isSearching = true;
  List<Diary> diaryList = [];
  int diaryListCount = 0;

  Future<void> getDiary() async {
    List<Diary> a = await _sqfLiteDiaryData.getAllDiary();
    setState(() {
      diaryList = a;
      diaryListCount = a.length;
      isSearching = false;
    });
  }

  @override
  void initState() {
    getDiary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (isSearching) CircularProgressIndicator(),
        if (!isSearching && diaryListCount == 0) Center(child: Text("Pas de photo souvenir")),
        if (!isSearching && diaryListCount != 0)
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            margin: EdgeInsets.only(top: 20),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return diaryList[i].image != null
                      ? ImgRemember(diary: diaryList[i])
                      : Text("");
                },
                separatorBuilder: (context, i) {
                  return SizedBox(height: 20);
                },
                itemCount: diaryListCount),
          ),
      ],
    );
  }
}
