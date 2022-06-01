import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_flutter/ui/principale.dart';

class PhotoDetail extends StatelessWidget {
  final Photo1 photo1; 
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
          title: Text(photo1.name, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromRGBO(75, 75, 75, 1)
          ),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.delete, color: Color.fromRGBO(75, 75, 75, 1), size: 24), onPressed: () {
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
                        child:Image.network(photo1.ImageURL),
                      ),
                      Positioned(
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width,
                        child:Text(photo1.desc)
                      ),
                    ],
                  ),
                ],
              ),
            ),

    );
  }

}