import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline),
                        hintText: "Adresse mail",
                      ),
                      validator: (i) {
                        if (!GetUtils.isEmail(i)) {
                          return "Adresse email non valide";
                        }
                        return null;
                      },
                      onSaved: (i) => email = i,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: isView,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isView = !isView;
                              });
                            },
                            icon: isView
                                ? Icon(Icons.lock)
                                : Icon(Icons.lock_open)),
                        hintText: "Mot de Passes",
                      ),
                      validator: (i) {
                        return null;
                      },
                      onSaved: (i) => password = i,
                    ),
                    SizedBox(height: 20),
                    TextButton(
                        child: Text("Mot de passe oublié ?"), onPressed: () {}),
                    SizedBox(height: 40),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFA2DBF0)),
                        minimumSize: MaterialStateProperty.all(Size(300, 40)),
                        maximumSize: MaterialStateProperty.all(Size(800, 40)),
                      ),
                      child: Text("S'inscrire",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        bool b = key.currentState?.validate() ?? false;
                        if (b) {
                         
                          key.currentState.save();
                          _auth.registerWithEmailAndPassword(email, password);
                        }
                      },
                    ),
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
                          Text("S'inscrire avec google",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      onPressed: () {
                        _auth.signInWithGoogle();
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
