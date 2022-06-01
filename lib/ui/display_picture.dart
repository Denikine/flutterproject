import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_flutter/modele/database_helper.dart';
import 'package:project_flutter/ui/accueil.dart';
import 'package:project_flutter/ui/listview_images.dart';
import 'package:camera/camera.dart';
import 'package:project_flutter/modele/Imagecamera.dart';
import 'package:project_flutter/ui/principale.dart';

import 'package:uuid/uuid.dart';

class DisplayPictureScreen extends StatelessWidget {
  List<CameraDescription> cameras; //liste de cameras disponibles

  //CameraScreen(this.cameras); // constructeur

  final String imagePath;
  DatabaseHelper db = DatabaseHelper.instance; // instance de la BDD
  String? id;
  String? photoname = "photo";
  String? path = "/image";

  DisplayPictureScreen(
      {Key? key, required this.cameras, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enregistrement de l\'image'),
        backgroundColor: const Color.fromARGB(55, 75, 75, 75),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (String? val) {
                      photoname = val!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Nom de la photo',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(55, 75, 75, 75)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.done),
                            onPressed: () {
                              _createNewImg(context);
                            }), // insertion de l'image dans la bdd
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createNewImg(BuildContext context) async {
    // insertion d'une nouvelle image dans la bdd et retour a la liste d'image

    String id = Uuid().v4();
    await db
        .insertPicture(Imagecamera(id, path!, photoname!).toMap())
        .then((_) {
      Navigator.pop(context); // retour a la connexion
    });
    back_to_list(context);
  }

  void back_to_list(
      BuildContext context) // retourne a la vue de la liste d'image
  {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => principale(
                content: '',
                title: '',
              )), //MyApp()),
    );
  }
}
