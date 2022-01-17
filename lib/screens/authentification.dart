import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flu/constants.dart';
import 'package:flutter_flu/services/auth_helper.dart';
import 'package:get/get.dart';

class Authentification extends StatefulWidget {
  const Authentification({Key key}) : super(key: key);

  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  String email;
  String password;
  bool isView = false;
  @override
  Widget build(BuildContext context) {
    AuthentificationHelper _auth = AuthentificationHelper(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 100),
          Form(
              key: key,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFA2DBF0)),
                        minimumSize: MaterialStateProperty.all(Size(300, 40)),
                        maximumSize: MaterialStateProperty.all(Size(800, 40)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Image.asset("assets/images/google.png",
                              width: 20, height: 20),
                          SizedBox(width: 50),
                          Text("Synchroniser avec google",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      onPressed: () async {
                        Flushbar(
                          message: "N'est pas disponible pour le moment ",
                          backgroundColor: appColor.mainColor,
                          titleText: Text(
                            "Desolé ",
                            style: TextStyle(fontSize: 18),
                          ),
                          duration: Duration(seconds: 3),
                        ).show(context);
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
