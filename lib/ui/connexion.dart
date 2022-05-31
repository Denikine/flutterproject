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
  static String routeName = '/connexion';
  DatabaseHelper db = DatabaseHelper.instance; // instance de la BDD

  TextEditingController emailController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          leading: const BackButton(
            color: Color.fromRGBO(75, 75, 75, 1)
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 233, 233, 233),
        child: Column(
          children: <Widget>[
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width,
                child: const Text('RemindMe', textAlign: TextAlign.center, overflow: 
                TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 75, color: Color.fromRGBO(75, 75, 75, 1)),)
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
                            color: Color.fromRGBO(75, 75, 75, 1)),
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
                          color: Color.fromRGBO(75, 75, 75, 1)),
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
                        "Pas de compte ? S'inscrire",
                        style: TextStyle(
                            color: Color.fromRGBO(75, 75, 75, 1),
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
                      shadowColor: Color.fromRGBO(75, 75, 75, 1),
                      color: Color.fromRGBO(75, 75, 75, 1),
                      elevation: 7.0,
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint("debug");
                          connexion();
                        },
                        child: Center(
                          child: const Text("Continuer", style: TextStyle(color: Colors.white)), 
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
