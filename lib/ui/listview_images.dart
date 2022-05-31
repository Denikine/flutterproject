import 'package:flutter/material.dart';

import 'package:camera/camera.dart';

import 'dart:io';

import 'package:project_flutter/modele/database_helper.dart';
import 'package:project_flutter/ui/camera.dart';
import 'package:project_flutter/ui/create_reminder.dart';

import '../main.dart';
import 'add_user.dart';

class ListViewImages extends StatefulWidget {
  List<CameraDescription> cameras;

  ListViewImages(
      this.cameras); // on prend les cameras viable du main pour les passer a la vue camera

  @override
  _ListViewImagesState createState() => new _ListViewImagesState();
}

class _ListViewImagesState extends State<ListViewImages> {
//List<Asset> images= List<Asset>();
  DatabaseHelper db = DatabaseHelper.instance; // instance de la BDD

  var url = "assets/json/path.json";

  @override
  void initState() // Au debut de l'application on intialise les données
  {
    super.initState();

    db.getAllImage().then((notes) {
      setState(() {
        notes.forEach((note) {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewImages Demo'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add_box),
              onPressed:
                  () {}), // bouton temporaire pour créer un image dans la BDD
        ],
      ),
      body: GridView.count(
        //liste d'images en forme de grille
        crossAxisCount: 2,
      ),
      drawer: Drawer(), // slider en haut a gauche de l'application
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TextFieldDateTimePicker()));
                // on passe a la vue create_rappel);
              },
              icon: const Icon(Icons.home),
            ),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TextFieldDateTimePicker()));
                // on passe a la vue create_rappel);
              },
              icon: const Icon(Icons.calendar_today),
            ),
            label: "Rappel",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // position d'un bouton pour la prise de photo
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CameraScreen(cameras: widget.cameras) // on passe la camera
                ),
          );
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
