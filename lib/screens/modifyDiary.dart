import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_flu/models/diary.dart';
import 'package:flutter_flu/widgets/flushBar.dart';
import 'package:flutter_flu/services/sqflite_gestionAppData.dart';
import 'package:image_picker/image_picker.dart';

class Authentification extends StatefulWidget {
  final Diary diary;
  const Authentification({Key key, this.diary}) : super(key: key);

  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  File imagePick;
  String image;
  String titre;
  String body;
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool shouldvalidate = false;
  SqfLiteDiaryData data = SqfLiteDiaryData();
  final ImagePicker _picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final XFile pickedImage = await _picker.pickImage(source: source);
    setState(() {
      if (pickedImage != null) {
        image = pickedImage.path;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Life Diary", style: TextStyle(color: Colors.black)),
          elevation: 0,
        ),
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12.5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: widget.diary != null
                              ? Image.asset(widget.diary.image)
                              : ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.image),
                                  label: Text("Ajouter une image"))),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          cursorHeight: 25,
                          cursorColor: Colors.black,
                          initialValue:
                              widget.diary != null ? widget.diary.titre : " ",
                          decoration: InputDecoration(
                            prefix: Text("Titre : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          onSaved: (value) {
                            titre = value;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          maxLines: 20,
                          cursorHeight: 25,
                          cursorColor: Colors.black,
                          initialValue:
                              widget.diary != null ? widget.diary.body : "",
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(07.5),
                                borderSide: BorderSide(color: Colors.blue)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.green)),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().length == 0) {
                              return "Veillez saisir quelque chose";
                            }

                            return null;
                          },
                          onSaved: (value) {
                            body = value;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.close),
                              label: Text("Annuler")),
                          ElevatedButton.icon(
                              onPressed: () async {
                                bool b =
                                    _formKey.currentState?.validate() ?? false;
                                setState(() {
                                  shouldvalidate = true;
                                });

                                if (b) {
                                  _formKey.currentState.save();
                                  Diary newDiary = Diary(
                                    titre: titre == null ? " " : titre,
                                    body: body,
                                    date: DateTime.now().toString(),
                                    image: "assets/images/defaultImage.png",
                                  );
                                  if (widget.diary == null) {
                                    await data.insert(newDiary);
                                    flushBarAdd(context);
                                  } else {
                                    await data.update(newDiary);
                                  }

                                  flushBarAdd(context);
                                  Navigator.pop(context);
                                }
                              },
                              icon: Icon(Icons.save_alt),
                              label: Text("Enrégistré")),
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
