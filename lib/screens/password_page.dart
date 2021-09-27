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
    return Container(
      // color: backgroundcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.end ,
        children: [
          // CircleAvatar(
          //   backgroundImage: AssetImage("assets/images/fingerprint.jpg"),
          // ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white54, borderRadius: BorderRadius.circular(20)),
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
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            see = !see;
                          });
                        },
                        icon: see
                            ? Icon(Icons.remove_red_eye_outlined,
                                color: Colors.black)
                            : Icon(Icons.panorama_fish_eye,
                                color: Colors.black))),
                onSaved: (_passwordInField) {
                  _password = _passwordInField;
                },
              ),
            ),
          ),
          Container(
            width: width(context),
            padding: EdgeInsets.only(top: 20, right: 30),
            child: Text(
              "Mot de passe oublié ?",
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.blue),
            ),
          ),
          SizedBox(height: 60),
          GestureDetector(
            onTap: () async {
              bool v = _formkey.currentState?.validate() ?? false;
              if (v) {
                _formkey.currentState?.save();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Text(
                "SUIVANT",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
