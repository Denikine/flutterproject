// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project_flutter/main.dart';
import 'package:camera/camera.dart';
import 'package:project_flutter/ui/rechercher.dart';
import 'package:project_flutter/ui/accueil.dart';
import 'package:camera/camera.dart';
import 'package:project_flutter/ui/voirphoto.dart';

import 'camera.dart';
import 'package:project_flutter/ui/create_reminder.dart';

class principale extends StatefulWidget {
  static String routeName = '/principale';
  principale({Key? key, required String title, required String content}): super(key: key);

  @override
  _principaleState createState() => _principaleState();
}

class Photo1{
  final String name,ImageURL,desc;
  Photo1(this.name, this.ImageURL, this.desc);
}

class _principaleState extends State<principale> {

//===============================================================================================================
//=========================================  Liste photos  ======================================================
//===============================================================================================================

  static List<String> Photo = ['Photo1'];

  static List<String> url = ['https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg'];

  final List<Photo1> photodata = List.generate(
    Photo.length,(index) => Photo1('${Photo[index]}', '${url[index]}', '${Photo[index]} Description...'));

//===============================================================================================================
//=========================================  Scrolling  =========================================================
//===============================================================================================================

  final ScrollController _scrollController = ScrollController();
  List<String> items = [];
  bool loading = false, allLoaded = false;

  mockFetch() async {
    if (allLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    List<String> newData=url;
    if (newData.isNotEmpty) {
      items.addAll(url);
    }
    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

//===============================================================================================================
//====================================== 3 dot -> Deconnexion ===================================================
//===============================================================================================================

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
        print('Deconnexion clicked');
        break;
    }
  }

//===============================================================================================================
//===============================================================================================================

  @override
  void initState() {
    super.initState();
    mockFetch();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !loading){
        mockFetch();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

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
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          centerTitle: true,
          title: const Text(
            'RemindMe',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromRGBO(75, 75, 75, 1)),
          ),
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

            body: LayoutBuilder(builder: (context, constraints) {
              if (items.isNotEmpty) {
                return Stack(
                  children: [
                    ListView.separated(
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        if(index<items.length){
                          return ListTile(                          
                            title: Text(photodata[index].name),
                            leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.network(photodata[index].ImageURL),
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PhotoDetail(photo1: photodata[index],)));
                            },
                          );
                        } else {
                          return Container(
                            width: constraints.maxWidth,
                            height: 50,
                            child: Center(
                              child: Text("Plus aucunes images"),
                            ),
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 1,
                        );
                      },
                      itemCount: items.length + (allLoaded?1:0)
                    ),
                    if(loading)...[
                      Positioned(
                        left: 0,
                        bottom: 0,  
                        child: Container(
                          width: constraints.maxWidth,
                          height: 80,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),              

//===============================================================================================================
//===============================================================================================================
//=================================BottomBar : Rechercher et Créer ==============================================
//===============================================================================================================
//===============================================================================================================


      bottomNavigationBar: PreferredSize(
        preferredSize: const Size.fromHeight(55.0), // here the desired height
        child: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(75, 75, 75, 1),
          selectedItemColor: const Color.fromARGB(255, 233, 233, 233),
          unselectedItemColor: const Color.fromARGB(255, 233, 233, 233),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(onPressed: () {
                Navigator.push( context, MaterialPageRoute(
                    builder: (context) => CameraScreen(cameras: cameras) // on passe la camera
                        ),
                  );
              }, icon: const Icon(Icons.camera_alt_outlined, color: Color.fromARGB(255, 233, 233, 233))),
              label: "Photo",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TextFieldDateTimePicker()));
                },
                icon: const Icon(Icons.calendar_today),
              ),
              label: "Rappel",
            )
          ],
        ),
      ),
    );
  }
}
