// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project_flutter/main.dart';
import 'package:project_flutter/ui/add_user.dart';
import 'package:project_flutter/ui/connexion.dart';

class accueil extends StatelessWidget {

  const accueil({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 233, 233, 233),

          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10)),

//-------------------------------------------------------------------------//
//------------------------- Bienvenue sur -------------------------//
//------------------------------------------------------------------------//

              Container(
                color: const Color.fromARGB(255, 233, 233, 233),
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width,
                child: const Text('Bienvenue sur', textAlign: TextAlign.center, overflow: 
                TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromRGBO(75, 75, 75, 1)),)
              ),
              Container(
                color: const Color.fromARGB(255, 233, 233, 233),
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width,
                child: const Text('RemindMe', textAlign: TextAlign.center, overflow: 
                TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 75, color: Color.fromRGBO(75, 75, 75, 1)),)
              ),

//------------------------------------------------------------------------------------------//
//------------------------- Bouton + intitulé Rejoindre une partie -------------------------//
//------------------------------------------------------------------------------------------//

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1)),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.42,
                        child: Column(
                          children:[
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('image/Cloche.png'), fit: BoxFit.contain)
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01)),
                            Container(
                              color: const Color.fromARGB(255, 233, 233, 233),
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: const Text("L'application de rappel et de sauvegarde", textAlign: TextAlign.center, overflow: 
                              TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromRGBO(75, 75, 75, 1)),)
                            ),
                            Container(
                              color: const Color.fromARGB(255, 233, 233, 233),
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: const Text('de photos', textAlign: TextAlign.center, overflow: 
                              TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color.fromRGBO(75, 75, 75, 1)),)
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

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(75, 75, 75, 1),
        selectedItemColor: const Color.fromARGB(255, 233, 233, 233),
        unselectedItemColor: const Color.fromARGB(255, 233, 233, 233),
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {
              Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddUser(cameras)) 
                          );
            }, icon: const Icon(Icons.person_add, color: Color.fromARGB(255, 233, 233, 233))),
            label: "S'inscrire", 
          ),
          
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {
              Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Connexion(cameras)) 
                          );
            }, icon: const Icon(Icons.login, color: Color.fromARGB(255, 233, 233, 233))),
            label: 'Se connecter', 
          ),
        ],

      ),

    );
  }
}