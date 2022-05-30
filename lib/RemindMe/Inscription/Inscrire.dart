// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutterproject/RemindMe/Accueil.dart';
import 'package:flutterproject/RemindMe/Page_Principale/Principale.dart';
import '../Data.dart';

class Inscrire extends StatelessWidget {
  static String routeName = '/Inscrire';
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  Inscrire({Key? key, required String title, String? content}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
      
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 233, 233, 233),

          child: Column(
            children: [

              Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10)),
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
                        controller: _password,
                        decoration: const InputDecoration(
                          hintText: 'Mot de passe',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02)),

                    SizedBox(
                      width: 300.0, 
                      child: TextField(
                        controller: _email,
                        decoration: const InputDecoration(
                          hintText: 'Email',
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
                        child: const Text("Je m'inscris", style: TextStyle(color: Colors.white)), 
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