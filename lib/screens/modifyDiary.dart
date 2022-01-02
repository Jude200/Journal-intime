import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_flu/models/diary.dart';
import 'package:flutter_flu/services/dateformat.dart';
import 'package:flutter_flu/widgets/flushBar.dart';
import 'package:flutter_flu/services/sqflite_helperDiary.dart';
import 'package:flutter_flu/widgets/home.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Authentification extends StatefulWidget {
  const Authentification({Key key, this.diary}) : super(key: key);

  final Diary diary;

  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  String body;
  SqfLiteDiaryData data = SqfLiteDiaryData();
  String image;
  File imagePick;
  bool shouldvalidate = false;
  String titre;
  bool ismodify = false;

  final GlobalKey<FormState> _formKey = GlobalKey();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    if (widget.diary == null) {
      ismodify = true;
    }
    super.initState();
  }

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
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12.5),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(formatDate(DateTime.now().toString()),
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  SizedBox(height: 20),
                  if (widget.diary != null)
                    if (widget.diary.image != null)
                      Hero(
                          child:
                              Image.file(File(widget.diary.image), height: 200),
                          tag: widget.diary.date),
                  if (widget.diary == null && image != null)
                    Image.file(File(image), height: 200),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () async {
                              await getImage(ImageSource.gallery);
                              print(image);
                              setState(() {
                                if (widget.diary != null) {
                                  widget.diary.image = image;
                                }
                              });
                            },
                            icon: Icon(Icons.image_outlined),
                            label: Text("Impoter une image")),
                        SizedBox(width: 20),
                        ElevatedButton.icon(
                            onPressed: () {
                              getImage(ImageSource.camera);
                              print(image);
                            },
                            icon: Icon(Icons.camera),
                            label: Text("Prendre une photo")),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      enabled: ismodify,
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
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      maxLines: 20,
                      enabled: ismodify,
                      cursorHeight: 25,
                      cursorColor: Colors.black,
                      initialValue:
                          widget.diary != null ? widget.diary.body : "",
                      decoration: InputDecoration(
                        hintText: "Message ...",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(07.5),
                            borderSide: BorderSide(color: Colors.blue)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(07.5),
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().length == 0) {
                          return "Veillez saisir quelque chose ";
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  Get.back();
                                });
                              },
                              icon: Icon(Icons.close),
                              label: Text("Annuler")),
                        ),
                      ),
                      if (!ismodify)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    ismodify = !ismodify;
                                  });
                                },
                                icon: Icon(Icons.edit),
                                label: Text("Modifier")),
                          ),
                        ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                              onPressed: () async {
                                bool b =
                                    _formKey.currentState?.validate() ?? false;
                                setState(() {
                                  shouldvalidate = true;
                                });

                                if (b) {
                                  _formKey.currentState.save();
                                  Diary newDiary = Diary(
                                      id: widget.diary == null
                                          ? null
                                          : widget.diary.id,
                                      titre: titre == null ? " " : titre,
                                      body: body,
                                      date:
                                          formatDate(DateTime.now().toString()),
                                      image: widget.diary == null
                                          ? image
                                          : widget.diary.image);
                                  if (widget.diary == null) {
                                    await data.insert(newDiary);
                                    Get.off(() => Home());
                                    await flushBarAdd(context);
                                  } else {
                                    await data.update(newDiary);
                                    Get.off(() => Home());
                                    await flushBarUpdate(context);
                                  }
                                }
                              },
                              icon: Icon(Icons.save_alt),
                              label: Text("Enrégistré")),
                        ),
                      ),
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
