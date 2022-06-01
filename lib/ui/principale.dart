// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:project_flutter/main.dart';
import 'package:camera/camera.dart';
import 'package:project_flutter/notification/notification_api.dart';
import 'package:project_flutter/ui/rechercher.dart';
import 'package:project_flutter/ui/accueil.dart';
import 'package:camera/camera.dart';
import '../notification/notification.dart';
import 'package:project_flutter/ui/voirphoto.dart';
import 'package:project_flutter/ui/widgets/reminderDisplay.dart';
import 'package:project_flutter/modele/reminder.dart';
import 'camera.dart';
import 'package:project_flutter/ui/create_reminder.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

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

 
  static List<String> Photo = ['Photo1', 'photo2', 'photo2', 'photo2', 'photo2', 'photo2', 'photo2', 'photo2', 'photo2', 'photo2', 'photo2', 'photo2'];

  static List<String> url = ['https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 'https://cdn.sortiraparis.com/images/80/83517/753564-visuel-paris-tour-eiffel-rue.jpg', 
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Colosseo_2020.jpg/1200px-Colosseo_2020.jpg'];

  final List<Photo1> photodata = List.generate(
      Photo.length,
      (index) => Photo1('${Photo[index]}', '${url[index]}',
          '${Photo[index]} Description...'));

//===============================================================================================================
//=========================================  Liste rappels ======================================================
//===============================================================================================================

  static List<String> Reminder = ['Rappel1', 'Rappel2', 'Rappel3'];
  static List<String> title = ['rappel1', 'rappel2', 'rappel2'];
  static List<String> date = ['27/08/1998', '30-05-2020', '30-05-2020'];
  static List<String> time = ['10:51', '08:17', '08:17'];
  static List<String> comment = ['Commentaire1', 'Commentaire2', 'Commentaire2'];

  final List<Reminder1> reminderdata = List.generate(
      Reminder.length,
      (index1) => Reminder1('${title[index1]}', '${comment[index1]}',
          '${date[index1]}', '${time[index1]} Description...'));

//===============================================================================================================
//=========================================  Scrolling Rappels ==================================================
//===============================================================================================================

  final ScrollController _scrollController1 = ScrollController();
  List<String> itemsrappels = [];
  bool loading1 = false, allLoaded1 = false;

  mockFetch1() async {
    if (allLoaded1) {
      return;
    }
    setState(() {
      loading1 = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    List<String> newData1 = Reminder;
    if (newData1.isNotEmpty) {
      itemsrappels.addAll(Reminder);
    }
    setState(() {
      loading1 = false;
      allLoaded1 = true;
    });
  }

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
      allLoaded = true;
    });
  }

//===============================================================================================================
//====================================== 3 dot -> Deconnexion ===================================================
//===============================================================================================================

  var myMenuItems = <String>[
    'Paramètres',
    'Deconnexion',
  ];
  
  BuildContext? _context;

  Future<void> onSelect(item) async {
    switch (item) {
      case 'Paramètres':
        //createNotificationSTP();
        //DateTime.utc(2022,6,1,16);
        createReminderNotification(DateTime.now(),'a','b');
        break;
      case 'Deconnexion':
          Navigator.push(_context!,
            MaterialPageRoute(builder: (context) => accueil()));
        break;
    }
  }

//===============================================================================================================
//=========================================== Rappel ============================================================
//===============================================================================================================
  @override
  void dispose1() {
    super.dispose();
    _scrollController1.dispose();
  }

//===============================================================================================================
//=========================================== Photos ============================================================
//===============================================================================================================

  @override
  void initState() {
    super.initState();
    mockFetch();
    mockFetch1();
    _scrollController1.addListener(() {
      if (_scrollController1.position.pixels >= _scrollController1.position.maxScrollExtent && !loading1) {
        mockFetch1();
      }
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !loading) {
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
    _context=context;
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
          backgroundColor: const Color.fromRGBO(75, 75, 75, 1),
          centerTitle: true,
          title: const Text(
            'RemindMe',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 233, 233, 233)),
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
//============================================= Photos ==========================================================
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      color: const Color.fromARGB(255, 233, 233, 233),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width,
                      child: const Text('Mes Rappels', textAlign: TextAlign.center, overflow: 
                      TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromRGBO(75, 75, 75, 1)),)
                    ),

                    Expanded(
                      child: Stack(
                        children: [
                          ListView.separated(
                            controller: _scrollController1,
                            itemBuilder: (context, index1) {
                              if (index1 < itemsrappels.length) {
                                return ListTile(
                                  title: Text(reminderdata[index1].date, textAlign: TextAlign.right,),
                                  leading: Container( 
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    color: Color.fromARGB(255, 233, 233, 233),
                                    child: Text(reminderdata[index1].title, textAlign: TextAlign.left,),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => ReminderDetail(
                                              reminder1: reminderdata[index1],
                                            )));
                                  },
                                );
                              } else {
                                return Container(
                                  width: constraints.maxWidth,
                                  height: 50,
                                  child: Center(
                                    child: Text("Fin des rappels"),
                                  ),
                                );
                              }
                            },
                            separatorBuilder: (BuildContext context, int index1) {
                              return Divider(
                                height: 1,
                              );
                            },
                            itemCount: itemsrappels.length + (allLoaded1 ? 1 : 0),
                          ),  
                          if(loading1)...[
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
                      ), 
                    ),

                    Container(
                      color: const Color.fromARGB(255, 233, 233, 233),
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width,
                      child: const Text('Mes Photos', textAlign: TextAlign.center, overflow: 
                      TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromRGBO(75, 75, 75, 1)),)
                    ), 

                    Expanded(
                      child: Stack(
                        children: [
                          ListView.separated(
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              if (index < items.length) {
                                return ListTile(
                                  title: Text(photodata[index].name),
                                  leading: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(photodata[index].ImageURL),
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
                                    child: Text("Fin des images"),
                                  ),
                                );
                              }
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 1,
                              );
                            },
                            itemCount: items.length + (allLoaded ? 1 : 0),
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
                      ), 
                    ), 
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
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
          backgroundColor: Color.fromARGB(172, 233, 233, 233),
          selectedItemColor: const Color.fromRGBO(75, 75, 75, 1),
          unselectedItemColor: const Color.fromRGBO(75, 75, 75, 1),
          elevation: 5,
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
                      color: Color.fromRGBO(75, 75, 75, 1))),
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
