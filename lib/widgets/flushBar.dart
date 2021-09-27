import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

flushBarAdd(_) async {
  return Flushbar(
    title: "Journal Ajouté ",
    message: "Votre journal a été bien ajouté.",
    duration: Duration(seconds: 3),
    messageColor: Colors.green,
    icon: Icon(Icons.check_circle),
  ).show(_);
}
