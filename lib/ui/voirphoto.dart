import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_flutter/ui/principale.dart';
import 'package:project_flutter/modele/Imagecamera.dart';
import 'dart:io';
import 'package:project_flutter/modele/database_helper.dart';
import 'package:sqflite/sqlite_api.dart';

class PhotoDetail extends StatelessWidget {
  final Imagecamera photo1; 
  const PhotoDetail({Key? key, required this.photo1}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

//===============================================================================================================
//=================================AppBar : Retour + Supprimer photo ============================================
//===============================================================================================================

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55.0), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          leading: const BackButton(
            color: Color.fromRGBO(75, 75, 75, 1)
          ),
          centerTitle: true,
          title: Text(photo1.photoname, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromRGBO(75, 75, 75, 1)
          ),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.delete, color: Color.fromRGBO(75, 75, 75, 1), size: 24), onPressed: () {
              DatabaseHelper db = DatabaseHelper.instance;
              print(this.photo1);
              db.deletePicture(this.photo1.id);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => principale(content: '', title: '',)), 
              ModalRoute.withName('/principale')
              );
            }),
          ],
        ),
      ),

//===============================================================================================================
//===============================================================================================================
//===============================================================================================================

      body: Container(
              color: const Color.fromARGB(255, 233, 233, 233),
              width: MediaQuery.of(context).size.width,
              child:Column(
                children:[
                  Column(
                    children:[
                      Positioned(
                        height: MediaQuery.of(context).size.height * 0.70,
                        width: MediaQuery.of(context).size.width,
                        child:Image.file(File(photo1.path)),
                      ),
                      Positioned(
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width,
                        child:Text(photo1.photoname)
                      ),
                    ],
                  ),
                ],
              ),
            ),

    );
  }

}