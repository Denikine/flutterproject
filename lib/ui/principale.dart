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
import 'package:project_flutter/ui/widgets/reminderDisplay.dart';
import 'package:project_flutter/modele/reminder.dart';
import 'camera.dart';
import 'package:project_flutter/ui/create_reminder.dart';

class principale extends StatefulWidget {
  static String routeName = '/principale';
  principale({Key? key, required String title, required String content})
      : super(key: key);

  @override
  _principaleState createState() => _principaleState();
}

class Photo1 {
  final String name, ImageURL, desc;
  Photo1(this.name, this.ImageURL, this.desc);
}

class Reminder1 {
  final String title, comment, date, time;
  Reminder1(this.title, this.comment, this.date, this.time);
}

class _principaleState extends State<principale> {
//===============================================================================================================
//=========================================  Liste photos  ======================================================
//===============================================================================================================

  static List<String> Photo = ['Photo1', 'photo2'];

  static List<String> url = [
    'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Colosseo_2020.jpg/1200px-Colosseo_2020.jpg'
  ];

  final List<Photo1> photodata = List.generate(
      Photo.length,
      (index) => Photo1('${Photo[index]}', '${url[index]}',
          '${Photo[index]} Description...'));

//===============================================================================================================
//=========================================  Liste rappels ======================================================
//===============================================================================================================

  static List<String> Reminder = ['Rappel1', 'Rappel2'];
  static List<String> title = ['rappel1', 'rappel2'];
  static List<String> date = ['27/08/1998', '30-05-2020'];
  static List<String> time = ['10:51', '08:17'];
  static List<String> comment = ['Commentaire1', 'Commentaire2'];

  final List<Reminder1> reminderdata = List.generate(
      Reminder.length,
      (index) => Reminder1('${title[index]}', '${comment[index]}',
          '${date[index]}', '${time[index]}'));

//===============================================================================================================
//=========================================  Scrolling Photos ===================================================
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
    List<String> newData = url;
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
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
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
//============================================= Rappels =========================================================
//===============================================================================================================

      body: LayoutBuilder(builder: (context, constraints) {
        if (items.isNotEmpty) {
          return Scaffold(
            body: Center(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                color: const Color.fromARGB(255, 233, 233, 233),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                        color: const Color.fromARGB(255, 233, 233, 233),
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          'Mes Rappels',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(75, 75, 75, 1)),
                        )),
                    Expanded(
                        child: ListView.separated(
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < items.length) {
                          return ListTile(
                            leading: const Icon(Icons.alarm),
                            title: Text(reminderdata[index].title),
                            subtitle: Text(reminderdata[index].comment),
                            // ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ReminderDetail(
                                        reminder1: reminderdata[index],
                                      )));
                            },
                          );
                        } else {
                          return Container(
                            width: constraints.maxWidth,
                            height: 50,
                            child: Center(
                              child: Text("Plus de rappels"),
                            ),
                          );
                        }
                      },
                      itemCount: items.length + (allLoaded ? 1 : 0),
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 1,
                        );
                      },
                    )),

//===============================================================================================================
//============================================= Photos ==========================================================
//===============================================================================================================

                    SizedBox(height: 30),
                    Container(
                        color: const Color.fromARGB(255, 233, 233, 233),
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          'Mes Photos',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(75, 75, 75, 1)),
                        )),
                    Expanded(
                      child: ListView.separated(
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            if (index < items.length) {
                              return ListTile(
                                title: Text(photodata[index].name),
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child:
                                      Image.network(photodata[index].ImageURL),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PhotoDetail(
                                            photo1: photodata[index],
                                          )));
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
                          itemCount: items.length + (allLoaded ? 1 : 0)),
                    ),
                  ],
                ),
              ),
            ),
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
//================================ BottomBar : Créer Photo et Rappel ============================================
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
              icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CameraScreen(
                              cameras: cameras) // on passe la camera
                          ),
                    );
                  },
                  icon: const Icon(Icons.camera_alt_outlined,
                      color: Color.fromARGB(255, 233, 233, 233))),
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
