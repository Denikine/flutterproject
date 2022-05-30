// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutterproject/RemindMe/Connexion/Seconnecter.dart';
import 'package:flutterproject/RemindMe/Inscription/Inscrire.dart';
import '../Data.dart';

class Principale extends StatelessWidget {
  
  var myMenuItems = <String>[
    'Paramètres',
    'Deconnexion',
  ];

  void onSelect(item) {
    switch (item) {
      case 'Paramètres':
        print('Paramètres clicked');
        break;
      case 'Deconnexion':
        print('Profile clicked');
        break;
    }
  }

  static String routeName = '/Principale';

  Principale({Key? key, required String title, required String content}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

//===============================================================================================================
//===============================================================================================================
//=================================AppBar : 3 dots paramètres et Deconnexion=====================================
//===============================================================================================================
//===============================================================================================================

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55.0), // here the desired height
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          leading: const BackButton(
            color: Color.fromRGBO(75, 75, 75, 1)
          ),
          centerTitle: true,
          title: const Text('RemindMe', textAlign: TextAlign.center, overflow: 
                    TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromRGBO(75, 75, 75, 1)),),
          actions: <Widget>[
            PopupMenuButton<String>(
                onSelected: onSelect,
                itemBuilder: (BuildContext context) {
                  return myMenuItems.map((String choice) {
                    return PopupMenuItem<String>(
                      child: Text(choice),
                      value: choice,
                    );
                  }).toList();
                })
          ],
        ),
      ),
      
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================
//===============================================================================================================

      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          color: const Color.fromARGB(255, 233, 233, 233),

          child: Column(
            children: [

              Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.125)),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1)),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.42,
                        child: Column(
                          children:[
                            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.42)),
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

//===============================================================================================================
//===============================================================================================================
//=================================BottomBar : Rechercher et Créer ==============================================
//===============================================================================================================
//===============================================================================================================

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(75, 75, 75, 1),
        selectedItemColor: const Color.fromARGB(255, 233, 233, 233),
        unselectedItemColor: const Color.fromARGB(255, 233, 233, 233),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color.fromARGB(255, 233, 233, 233)),
            label: 'Rechercher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Color.fromARGB(255, 233, 233, 233)),
            label: 'Créer', 
          ),
        ],

      ),

    );
  }
}   