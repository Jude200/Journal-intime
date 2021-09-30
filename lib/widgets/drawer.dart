import 'package:flutter/material.dart';
import 'package:flutter_flu/screens/setting.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Drawer(
        elevation: 120,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Jude Seuch"),
                accountEmail: Text("judeseruch@gmail.com")),
            SizedBox(height: 20),
            Container(
              color: Colors.white70,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => AppSetting());
                },
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(20),
                        child: Icon(Icons.settings)),
                    Container(
                        child: Text("Paramètre",
                            style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white70,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(20), child: Icon(Icons.star)),
                  Container(
                      child: Text("Notez l'application",
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Icon(Icons.account_balance_outlined)),
                  Container(
                      child: Text("A propos",
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Icon(Icons.contact_mail)),
                  Container(
                      child: Text("Nous contactez",
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
