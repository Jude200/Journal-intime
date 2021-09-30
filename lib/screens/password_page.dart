import 'package:flutter/material.dart';
import 'package:flutter_flu/constants.dart';
import 'package:flutter_flu/screens/home_page.dart';

class Passwordpage extends StatefulWidget {
  const Passwordpage({key}) : super(key: key);

  @override
  _PasswordpageState createState() => _PasswordpageState();
}

class _PasswordpageState extends State<Passwordpage> {
  bool shouldValidator = false;
  var see = false;
  var _password;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //  double phone_width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          //  mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end ,
          children: [
            // CircleAvatar(
            //   backgroundImage: AssetImage("assets/images/fingerprint.jpg"),
            // ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Form(
                key: _formkey,
                child: TextFormField(
                  autovalidateMode: shouldValidator
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  obscureText: see,
                  cursorColor: Colors.white,
                  cursorHeight: 30,
                  decoration: InputDecoration(
                      //   border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(Icons.password, color: Colors.black),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              see = !see;
                            });
                          },
                          icon: !see
                              ? Icon(Icons.lock, color: Colors.black)
                              : Icon(Icons.lock_open, color: Colors.black))),
                  onSaved: (_passwordInField) {
                    _password = _passwordInField;
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              style: ButtonStyle(),
              onPressed: () {},
              child: Text(
                "Mot de passe oublié ??",
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("Suivant"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
