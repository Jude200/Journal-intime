import 'package:flutter/material.dart';
import 'package:flutter_flu/screens/authentification.dart';
import 'package:flutter_flu/screens/setting.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Drawer(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textButtonIcon(
                    Icons.cloud_outlined, "Synchroniser vos journaux", () {
                  Get.to(() => Authentification());
                }),
                textButtonIcon(Icons.settings_outlined, "Parametre", () {
                  Get.to(() => AppSetting());
                }),
                textButtonIcon(
                    Icons.star_outline, "Notez l'application", () {}),
                textButtonIcon(
                    Icons.contact_mail_outlined, "Nous contacter", () {}),
                textButtonIcon(Icons.exit_to_app_outlined, "Quitter", () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}

TextButton textButtonIcon(IconData icon, String text, onPressed) {
  return TextButton.icon(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: onPressed,
      icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Icon(icon)),
      label: Text(text));
}
