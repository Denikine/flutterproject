import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_flutter/modele/database_helper.dart';
import 'package:project_flutter/ui/listview_images.dart';
import 'package:camera/camera.dart';

import 'package:uuid/uuid.dart';

class DisplayPictureScreen extends StatelessWidget {
  List<CameraDescription> cameras; //liste de cameras disponibles

  //CameraScreen(this.cameras); // constructeur

  final String imagePath;
  DatabaseHelper db = DatabaseHelper.instance; // instance de la BDD

  DisplayPictureScreen({Key? key, required this.cameras, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.call), onPressed: null),
                        IconButton(
                            icon: Icon(Icons.apps),
                            onPressed: () {
                              back_to_list(context);
                            }),
                      ],
                    ),
                  ),
                  Expanded(
                    // rend les images responsives
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(
                              imagePath)), //Image.file(File(elem.path)), //new ExactAssetImage("assets/images/"+elem.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.accessibility_new),
                            onPressed: null),
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


    back_to_list(context);
  }

  void back_to_list(
      BuildContext context) // retourne a la vue de la liste d'image
  {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListViewImages(cameras)), //MyApp()),
    );
  }
}
