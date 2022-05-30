import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

import 'package:project_flutter/ui/display_picture.dart';

import 'package:path/path.dart' show join;
import 'dart:async';

class CameraScreen extends StatefulWidget {
  List<CameraDescription> cameras; //liste de cameras disponibles

  //CameraScreen(this.cameras); // constructeur
  CameraScreen({
    Key ?key,
    required this.cameras,
  }) : super(key: key);

  @override
  CameraScreenState createState() {
    return new CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() // selection de la camera et de la resolution
  {
    super.initState();
    controller =
        new CameraController(widget.cameras[0], ResolutionPreset.ultraHigh);

    _initializeControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    //dispose of hte controller when the widget is disposed
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(controller);
          } else // on attend le chargement de la camera
          {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () async {
            try {
              await _initializeControllerFuture;

              final path = join(
                (await getApplicationDocumentsDirectory()).path,
                '${DateTime.now()}.png',
              );

              await controller.takePicture();
              print(path);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayPictureScreen(
                      cameras: widget.cameras,
                      imagePath: path), //ListViewImages(widget.cameras),
                ),
              );
            } catch (e) {
              print(e);
            }
          }),
    );
  }
}
