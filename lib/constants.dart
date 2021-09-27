import 'package:flutter/material.dart';

bool isLoading = true;

double width(_) {
  return MediaQuery.of(_).size.width;
}

double height(_) {
  return MediaQuery.of(_).size.height;
}

/// Recuperation des données de la base de donnée pour le demarage de l'application

List<Color> backgroundColor = [
  //Couleur avec avec couleur de police blanche
  Color(0XFF4140FF),
  Color(0XFF080226),
  Color(0XFF9F28FF),
  //Couleur avec avec couleur de police noire
  Color(0XFFFF7729),
  Color(0XFFFFFFFF), // blanche
  Color(0XFF3AF7FF)
];
