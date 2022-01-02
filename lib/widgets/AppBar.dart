import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: Text("Life Diary", style: TextStyle(color: Colors.black)),
          elevation: 0,
        actions: [
          IconButton(onPressed:() {} , icon: Icon(Icons.three_k_outlined))
        ],
    );
  }
}