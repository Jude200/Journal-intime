import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

flushBarAdd(_) async {
  return Flushbar(
    title: "Journal Ajouté ",
    message: "Votre journal a été bien ajouté.",
    duration: Duration(seconds: 2),
    messageColor: Colors.green,
    icon: Icon(Icons.check_circle),
  ).show(_);
}

flushBarUpdate(_) async {
  return Flushbar(
    title: "Modification",
    message: "Votre journal a été bien modifier.",
    duration: Duration(seconds: 2),
    messageColor: Colors.green,
    icon: Icon(Icons.check_circle),
    blockBackgroundInteraction: true,
  ).show(_);
}
