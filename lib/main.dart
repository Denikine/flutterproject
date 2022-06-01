import 'package:flutter/material.dart';

import 'package:project_flutter/ui/accueil.dart';
import 'package:camera/camera.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

late List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  AwesomeNotifications().initialize(
    null,
     [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'basic_channel_description',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        channelDescription: 'Scheduled_channel_description',
        defaultColor: Color.fromARGB(255, 76, 182, 171),
        locked: true,
        importance: NotificationImportance.High,
      )
  ],
  // Channel groups are only visual and are not required
  debug: true
  );


  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterApp Mobile',
      //home: new ListViewImages(cameras),
      home: new accueil(),
    );
  }


}

