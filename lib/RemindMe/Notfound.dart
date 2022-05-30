import 'package:flutter/material.dart';
import '../main.dart';

class NotFound extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Erreur de navigation'),
),
body: Container(
alignment: Alignment.center,
child: const Text('404'),
),
);
}
}