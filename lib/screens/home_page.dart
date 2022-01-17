import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flu/constants.dart';
import 'package:flutter_flu/screens/MyImgRemember.dart';
import 'package:flutter_flu/screens/MyNews.dart';
import 'package:flutter_flu/screens/modifyDiary.dart';
import 'package:flutter_flu/widgets/floattingButton.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);
  static List<String> popMenuItems = [
    "Synchroniser vos journaux",
    "Parametre",
    "A propos",
    "Quitter"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          // backgroundColor: backgroundcolor,
          floatingActionButton: FloattingButton(widget: Authentification()),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            
            title: Text("Life Journal"),
            bottom: TabBar(tabs: [
              Tab(child: Text("Mes journaux")),
              Tab(child: Text("Photo Souvenir"))
            ]),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => popMenuItems
                      .map((e) => PopupMenuItem(
                            child: Text(e),
                            onTap: () async {
                              final navigator = Navigator.of(context);
                              await Future.delayed(Duration.zero);
                              e != "Quitter"
                                  ? navigator.push(MaterialPageRoute(
                                      builder: (context) => items[e]))
                                  : SystemNavigator.pop();
                            },
                          ))
                      .toList()),
            ],
          ),
          body: TabBarView(children: [MyNews(), MyImgRemember()])),
    );
  }
}
