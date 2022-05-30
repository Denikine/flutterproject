// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutterproject/RemindMe/Connexion/Seconnecter.dart';
import 'package:flutterproject/RemindMe/Inscription/Inscrire.dart';
import '../Data.dart';

class Principale extends StatelessWidget {
  static String routeName = '/Principale';

  const Principale({Key? key, required String title, required String content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 233, 233, 233),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.10)),

//-------------------------------------------------------------------------//
//------------------------- Bienvenue sur Kafumi -------------------------//
//------------------------------------------------------------------------//

              Container(
                  color: const Color.fromARGB(255, 233, 233, 233),
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'RemindMe',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 75,
                        color: Color.fromRGBO(33, 45, 64, 1)),
                  )),

//------------------------------------------------------------------------------------------//
//------------------------- Bouton + intitulé Rejoindre une partie -------------------------//
//------------------------------------------------------------------------------------------//

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.42,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Inscrire.routeName,
                            arguments: Data(
                              title: 'Envoyer des arguments',
                              content: 'Le contenu',
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('image/Cloche.png'),
                                      fit: BoxFit.contain)),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01)),
                            Container(
                                color: const Color.fromARGB(255, 233, 233, 233),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: const Text(
                                  "N'oubliez plus de remplir vos obligations, finir vos tâches",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color.fromRGBO(75, 75, 75, 1)),
                                )),
                            Container(
                                color: const Color.fromARGB(255, 233, 233, 233),
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: const Text(
                                  'une partie',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color.fromRGBO(75, 75, 75, 1)),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

//-----------------------------------------------------------------------------//
//------------------------- S'inscrire & Se connecter -------------------------//
//-----------------------------------------------------------------------------//

              Container(
                color: const Color.fromRGBO(33, 45, 64, 1),
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: const Color.fromRGBO(33, 45, 64, 1),
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Inscrire.routeName,
                                  arguments: Data(
                                    title: 'Envoyer des arguments',
                                    content: 'Le contenu',
                                  ),
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('image/Rechercher.png'),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                          ),
                          Container(
                            color: const Color.fromRGBO(33, 45, 64, 1),
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Seconnecter.routeName,
                                  arguments: Data(
                                    title: 'Envoyer des arguments',
                                    content: 'Le contenu',
                                  ),
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('image/Ajouter.png'),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                          ),
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
