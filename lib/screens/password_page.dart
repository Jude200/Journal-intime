import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flu/models/appData.dart';
import 'package:flutter_flu/services/sqfliteSettingData.dart';
import 'package:flutter_flu/widgets/home.dart';
import 'package:get/get.dart';

class Passwordpage extends StatefulWidget {
  const Passwordpage({key, this.ischange = false}) : super(key: key);

  final bool ischange;

  @override
  _PasswordpageState createState() => _PasswordpageState();
}

class _PasswordpageState extends State<Passwordpage> {
  AppData appData;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String password;
  String passwordIndicator;
  String passwordVerify;
  bool see = false;
  bool shouldValidator = false;

//  TextEditingController _controller = TextEditingController();
  SqfLiteSettingData _sqfLiteSettingData = SqfLiteSettingData();

  @override
  void initState() {
    getDataSetting();
    super.initState();
  }

  Future<void> getDataSetting() async {
    AppData a = await _sqfLiteSettingData.getData(1);
    print(a.password);
    setState(() {
      appData = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  double phone_width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          //  mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end ,
          children: [
            // CircleAvatar(
            //   backgroundImage: AssetImage("assets/images/fingerprint.jpg"),
            // )
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3)),

            Container(
              child: Form(
                key: key,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: shouldValidator
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      obscureText: see,
                      cursorHeight: 30,
                      decoration: InputDecoration(
                          //   border: OutlineInputBorder(borderSide: BorderSide.none),
                          hintText:
                              widget.ischange ? "Ancien mot de passe" : '',
                          prefixIcon: Icon(Icons.password, color: Colors.black),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  see = !see;
                                });
                              },
                              icon: !see
                                  ? Icon(Icons.lock, color: Colors.black)
                                  : Icon(Icons.lock_open,
                                      color: Colors.black))),
                      validator: (text) {
                        if (appData.password != null &&
                            appData.password != text) {
                          return "Le mot de passe saisi est incorrect";
                        }
                        if (text.trim().length == 0) {
                          return "Veuillez saisi un mot de passe";
                        }
                        return null;
                      },
                      onSaved: (i) {
                        passwordVerify = i;
                      },
                    ),
                    SizedBox(height: 20),
                    if (widget.ischange)
                      TextFormField(
                        autovalidateMode: shouldValidator
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        obscureText: see,
                        cursorHeight: 30,
                        decoration: InputDecoration(
                            //   border: OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Nouveau mot de passe',
                            prefixIcon:
                                Icon(Icons.password, color: Colors.black),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    see = !see;
                                  });
                                },
                                icon: !see
                                    ? Icon(Icons.lock, color: Colors.black)
                                    : Icon(Icons.lock_open,
                                        color: Colors.black))),
                        validator: (text) {
                          if (text.trim().length == 0) {
                            return "Veuillez saisi un mot de passe";
                          }
                          return null;
                        },
                        onSaved: (i) {
                          password = i;
                        },
                      ),
                    SizedBox(height: 20),
                    if (widget.ischange)
                      TextFormField(
                        maxLines: 2,
                        autovalidateMode: shouldValidator
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        cursorHeight: 30,
                        decoration: InputDecoration(
                          helperMaxLines: 3,
                          helperText:
                              "Ajouter une indication qui vous aidera en cas d'oubli de votre de passe (facultatif)",
                          //   border: OutlineInputBorder(borderSide: BorderSide.none),

                          prefixIcon:
                              Icon(Icons.drag_indicator, color: Colors.black),
                        ),
                        onSaved: (i) {
                          passwordIndicator = i;
                        },
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(),
                  onPressed: () {},
                  child: Text(
                    "Mot de passe oublié ??",
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("Suivant"),
              onPressed: () async {
                bool b = key.currentState.validate() ?? false;
                setState(() {
                  shouldValidator = true;
                });
                if (b) {
                  key.currentState.save();
                  appData.password =
                      !widget.ischange ? passwordVerify : password;
                  appData.passwordIndicator = passwordIndicator;
                  await _sqfLiteSettingData.update(appData);
                  Get.off(() => Home());
                  if (widget.ischange)
                    Flushbar(
                      title: "Password",
                      duration: Duration(milliseconds: 1500),
                      message: "Nouveau mot de passe ajouté",
                    ).show(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
