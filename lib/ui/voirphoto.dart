import 'package:flutter/material.dart';
import 'package:project_flutter/ui/principale.dart';

class PhotoDetail extends StatelessWidget {
  final Photo1 photo1; 
  const PhotoDetail({Key? key, required this.photo1}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55.0), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          leading: const BackButton(
            color: Color.fromRGBO(75, 75, 75, 1)
          ),
          centerTitle: true,
          title: Text(photo1.name, textAlign: TextAlign.center, overflow: 
                    TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromRGBO(75, 75, 75, 1)),),
        ),
      ),

      body: Column(
        children:[
          Image.network(photo1.ImageURL),
          Text(photo1.desc)
        ],
      ),

    );
  }

}