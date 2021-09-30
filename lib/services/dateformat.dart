List<String> monthList = [
  "Janvier",
  "Février",
  "Mars",
  "Avril",
  "Mai",
  "Juin",
  "Juillet",
  "Aout",
  "Septembre",
  "Octobre",
  "Novembre",
  "Décembre"
];

String formatDate(String date) {
  String year = date.substring(0, date.indexOf("-")); // L'annee
  String mmdd = date.substring(date.indexOf("-") + 1);
  String month = mmdd.substring(0, mmdd.indexOf("-")); // le mois
  String dd = mmdd.substring(mmdd.indexOf("-") + 1);
  int monthInt = int.parse(month);
  String day = dd.substring(0, dd.indexOf(" ")); //Le jour
  String hour = dd.substring(dd.indexOf(" ") + 1, dd.indexOf("."));

  return "$day ${monthList[monthInt - 1]} $year  $hour";
}
