import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/modele/database_helper.dart';
import 'package:camera/camera.dart';

import 'package:project_flutter/modele/user.dart';
import 'package:project_flutter/ui/listview_images.dart';
import 'package:project_flutter/ui/add_user.dart';

class Connexion extends StatefulWidget {
  List<CameraDescription> cameras; //liste de cameras disponibles

  //CameraScreen(this.cameras); // constructeur
  Connexion(this.cameras);

  @override
  ConnexionState createState() {
    return new ConnexionState();
  }
}

class ConnexionState extends State<Connexion> {
  DatabaseHelper db = DatabaseHelper.instance; // instance de la BDD

  TextEditingController emailController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(75),
              child: Center(
                child: Text("CONNEXION"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue),
                        ),
                      )),
                  SizedBox(height: 20.0), // Espace de separation
                  TextField(
                    controller: pwdController,
                    decoration: InputDecoration(
                      errorText: _validate
                          ? 'Mauvais identifiant ou mot de passe !'
                          : null,
                      labelText: 'MOT DE PASSE',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      onTap: () {
                        adduser();
                      },
                      child: Text(
                        'S\' inscrire',
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.lightBlueAccent,
                      color: Colors.blueAccent,
                      elevation: 7.0,
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint("efzerze");
                          connexion();
                        },
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
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

  // connexion d'un utilisateur et retourne son id
  void connexion() async {
    //int u = await db.queryRowCountUser();
    User? u =
        await db.getUserConnexion(emailController.text, pwdController.text);
        
    if (u != null) {
      debugPrint("Je suis connecté snon");
      _validate = false;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListViewImages(widget.cameras)),
      );
    } else {
      debugPrint("Je suis pas connecté soon");
      setState(() {
        _validate = true;
      });
    } // faire un truc
  }

  void adduser() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddUser(widget.cameras)),
    );
  }
}
