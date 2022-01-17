import 'package:flutter/material.dart';

class Apropospage extends StatelessWidget {
  const Apropospage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A propos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    height: 200,
                    child: Image.asset("assets/images/playstore.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Appréciez votre vie avec Life Diary grave a vos journaux, simple, gratuit et sécurisé ",
                          textAlign: TextAlign.center),
                    ],
                  )
                ],
              )),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    """
Auteur: Jude S. AGBODOYETIN (github.com/Jude200)

Maintenance: Equipe Veneficus @ePatriote.com

Email: contact@epatriote.com 

Site: LaSyntax.com""",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text("(C) ePatriote - Tous droits réservés.")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
