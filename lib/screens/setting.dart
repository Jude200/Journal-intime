import 'package:flutter/material.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({Key key}) : super(key: key);

  @override
  _AppSettingState createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  backgroundColor: backgroundcolor2,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.all(15),
              child: Text("Paramètre", style: TextStyle(fontSize: 30))),
          ExpansionTile(
            iconColor: Colors.yellow,
            title: Text(
              "Police",
              //  style: TextStyle(color: Colors.white),
            ),
            children: [ListTile(title: Text("Barrio"))],
          )
        ]),
      ),
    );
  }
}
