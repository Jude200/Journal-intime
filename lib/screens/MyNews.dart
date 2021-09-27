import 'package:flutter/material.dart';
import 'package:flutter_flu/models/diary.dart';
import 'package:flutter_flu/widgets/diary_card.dart';
import 'package:flutter_flu/services/sqflite_gestionAppData.dart';

class MyNews extends StatefulWidget {
  const MyNews({Key key}) : super(key: key);

  @override
  State<MyNews> createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  List myDiary = [];
  int myDiaryCount = 0;
  bool isLoading = true;
  SqfLiteDiaryData sqfLiteDiaryData = SqfLiteDiaryData();

  Future getDiary() async {
    List<Diary> diary = await sqfLiteDiaryData.getAllContact();
    print(diary);
    setState(() {
      myDiary = diary;
      myDiaryCount = diary.length;
      isLoading = false;
    });
  }

  @override
  void initState() {
    getDiary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (isLoading) Center(child: CircularProgressIndicator()),
      if (!isLoading && myDiaryCount == 0)
        Center(child: Text("Aucun journal enrégistré")),
      if (!isLoading && myDiaryCount != 0)
        Expanded(
          child: Container(
            child: ListView.separated(
              itemCount: myDiary.length,
              itemBuilder: (BuildContext context, index) {
                return DiaryCard(diary: myDiary[myDiaryCount - 1 - index]);
              },
              separatorBuilder: (context, indedx) => SizedBox(height: 15),
            ),
          ),
        ),
    ]);
  }
}
