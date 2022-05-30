// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutterproject/RemindMe/Accueil.dart';
import 'package:flutterproject/RemindMe/Page_Principale/Principale.dart';
import '../Data.dart';
import 'package:textfield_datepicker/textfield_dateAndTimePicker.dart';

class CreerRappel extends StatelessWidget {
  static String routeName = '/CreerRappel';
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  CreerRappel({Key? key, required String title, String? content})
      : super(key: key);

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
                  child: const Image(
                      image: AssetImage('image/Retour.png'),
                      alignment: Alignment.topLeft,
                      fit: BoxFit.contain),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.10)),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'RemindMe',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 75,
                        color: Color.fromRGBO(75, 75, 75, 1)),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      width: 300.0,
                      child: TextField(
                        controller: _username,
                        decoration: const InputDecoration(
                          hintText: "Titre du rappel",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02)),
                    SizedBox(
                      width: 300.0,
                      child: TextField(
                        controller: _password,
                        decoration: const InputDecoration(
                          hintText: 'Date du rappel',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02)),
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
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02)),
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
                        child: const Text("Je m'inscris",
                            style: TextStyle(color: Colors.white)),
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
