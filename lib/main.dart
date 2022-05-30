import 'package:flutter/material.dart';

import 'package:project_flutter/ui/connexion.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterApp Mobile',
      //home: new ListViewImages(cameras),
      home: new Connexion(cameras),
    );
  }
}
