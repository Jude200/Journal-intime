import 'package:flutter/material.dart';
import 'package:flutter_flu/screens/MyImgRemember.dart';
import 'package:flutter_flu/screens/MyNews.dart';
import 'package:flutter_flu/screens/modifyDiary.dart';
import 'package:flutter_flu/services/floattingButton.dart';
import 'package:flutter_flu/widgets/drawer.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          // backgroundColor: backgroundcolor,
          floatingActionButton: FloattingButton(widget: Authentification()),
          drawer: AppDrawer(),
          appBar: AppBar(
            title: Text("Life Journal"),
            bottom: TabBar(tabs: [
              Tab(child: Text("Mes journaux")),
              Tab(child: Text("Photo Souvenir"))
            ]),
          ),
          body: TabBarView(children: [MyNews(), MyImgRemember()])),
    );
  }
}
