// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutterproject/RemindMe/Accueil.dart';
import 'package:flutterproject/RemindMe/Page_Principale/Principale.dart';
import '../Data.dart';
import 'package:textfield_datepicker/textfield_dateAndTimePicker.dart';
import 'rappel.dart';
import 'package:intl/intl.dart';

//class CreerRappel extends StatelessWidget {
//  static String routeName = '/CreerRappel';
//  final _rappeltitle = TextEditingController();
//  final _rappeldescription = TextEditingController();
//  final _rappeldatetime = TextEditingController();
//  DateTime selectedDate = DateTime.now();
//}

class CreerRappel extends StatefulWidget {
  static String routeName = '/CreerRappel';
  const CreerRappel({Key? key}) : super(key: key);

  @override
  _CreerRappelState createState() => _CreerRappelState();
}

class _CreerRappelState extends State<CreerRappel> {
  Rappel task = new Rappel();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _formKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 233, 233, 233),
            leading: const BackButton(color: Color.fromRGBO(75, 75, 75, 1)),
          ),
        ),
        body: Center(
            child: Container(
                color: const Color.fromARGB(255, 233, 233, 233),
                child: Column(children: [
                  ListView(
                    children: [
                      Column(
                        children: [
                          TextFormField(
                            onSaved: (val) => task.name = val!,
                            decoration: const InputDecoration(
                              labelText: 'Titre du rappel',
                              icon: Icon(Icons.account_circle),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: TextFormField(
                              onSaved: (val) {
                                task.date = selectedDate;
                              },
                              controller: _dateController,
                              decoration: const InputDecoration(
                                labelText: "Date du rappel",
                                icon: Icon(Icons.calendar_today),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Renseignez une date pour votre rappel";
                                }
                                return null;
                              },
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                              }
                            },
                            child: const Text(
                              "Enregistrer",
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ]))));
  }

  _selectDate(BuildContext context) async {
    selectedDate;
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
      });
    }
  }
}
