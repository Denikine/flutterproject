// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutterproject/RemindMe/Accueil.dart';
import 'package:flutterproject/RemindMe/Page_Principale/Principale.dart';
import '../Data.dart';

class Seconnecter extends StatelessWidget {
  static String routeName = '/Seconnecter';
  final _connexion = TextEditingController();
  final _password = TextEditingController();

  Seconnecter({Key? key, required String title, String? content}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 233, 233, 233),

          child: Column(
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Accueil.routeName,
                      arguments: Data(
                        title: 'Envoyer des arguments',
                        content: 'Le contenu',
                      ),
                    );
                  },
                  child: const Image(image:AssetImage('image/Retour.png'),alignment: Alignment.topLeft,  fit: BoxFit.contain),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width,
                child: const Text('RemindMe', textAlign: TextAlign.center, overflow: 
                TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 75, color: Color.fromRGBO(75, 75, 75, 1)),)
              ),

              Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      width: 300.0, 
                      child: TextField(
                        controller: _connexion,
                        decoration: const InputDecoration(
                          hintText: "Nom d'utilisateur ou mot de passe",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02)),

                    SizedBox(
                      width: 300.0, 
                      child: TextField(
                        controller: _password,
                        decoration: const InputDecoration(
                          hintText: 'Mot de passe',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02)),

                    SizedBox(
                      height: 60,
                      width: 300.0,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Principale.routeName,
                            arguments: Data(
                              title: 'Envoyer des arguments',
                              content: 'Le contenu',
                            ),
                          );
                        },
                        color: const Color.fromRGBO(75, 75, 75, 1),
                        child: const Text("Continuer", style: TextStyle(color: Colors.white)), 
                      ),
                    ),
                    
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          
                          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.17)),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.49,
                                child: const Text("Vous n'avez pas encore de compte ?", textAlign: TextAlign.right, overflow: 
                                TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromRGBO(75, 75, 75, 1)),)
                              ),

                              Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01)),

                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.16,
                                child: const Text("s'inscrire ici", textAlign: TextAlign.left, overflow: 
                                TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromRGBO(75, 75, 75, 1)),)
                              ),
                              ],
                            ),
                          ),

                          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.17)),

                        ],
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
}