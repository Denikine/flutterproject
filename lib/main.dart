import 'package:flutter/material.dart';
import 'package:flutterproject/RemindMe/Connexion/Seconnecter.dart';
import 'package:flutterproject/RemindMe/Inscription/Inscrire.dart';
import 'package:flutterproject/RemindMe/Page_Principale/Principale.dart';
import 'package:flutterproject/RemindMe/Creation/CreerRappel.dart';
import 'RemindMe/Accueil.dart';
import 'RemindMe/Data.dart';
import 'RemindMe/Notfound.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation avec Flutter',
      initialRoute: Accueil.routeName,
      routes: {
        Accueil.routeName: (context) => const Accueil(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Inscrire.routeName) {
          final Data arguments = settings.arguments as Data;
          return MaterialPageRoute(builder: (context) {
            return Inscrire(
              title: arguments.title,
              content: arguments.content,
            );
          });
        }

        if (settings.name == Seconnecter.routeName) {
          final Data arguments = settings.arguments as Data;
          return MaterialPageRoute(builder: (context) {
            return Seconnecter(
              title: arguments.title,
              content: arguments.content,
            );
          });
        }

        if (settings.name == Principale.routeName) {
          final Data arguments = settings.arguments as Data;
          return MaterialPageRoute(builder: (context) {
            return Principale(
              title: arguments.title,
              content: arguments.content,
            );
          });
        }

        if (settings.name == CreerRappel.routeName) {
          final Data arguments = settings.arguments as Data;
          return MaterialPageRoute(builder: (context) {
            return CreerRappel(
              title: arguments.title,
              content: arguments.content,
            );
          });
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => NotFound());
      },
    ),
  );
}
