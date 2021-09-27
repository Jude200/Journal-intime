import 'package:flutter/material.dart';
import 'package:flutter_flu/models/diary.dart';

class MyImgRemember extends StatefulWidget {
  final Diary diary;
  const MyImgRemember({Key key, this.diary}) : super(key: key);

  @override
  _MyImgRememberState createState() => _MyImgRememberState();
}

class _MyImgRememberState extends State<MyImgRemember> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.green,
                width: 100,
                height: 150,
                child: widget.diary == null
                    ? Text("Jude")
                    : Image.asset(widget.diary.image),
              ),
            ],
          ),
        )
      ],
    );
  }
}
