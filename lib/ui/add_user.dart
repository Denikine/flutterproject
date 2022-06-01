import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:project_flutter/modele/user.dart';
import 'package:project_flutter/modele/database_helper.dart';
import 'package:camera/camera.dart';

class AddUser extends StatefulWidget {
  List<CameraDescription> cameras;

  AddUser(
      this.cameras); // on prend les cameras viable du main pour les passer a la vue camera

  @override
  _AddUserState createState() => new _AddUserState();
}

class _AddUserState extends State<AddUser> {
  DatabaseHelper db = DatabaseHelper.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  final datef = DateFormat("yyyy-MM-dd");
  late DateTime date;
  late String firstname, lastname, email, password, phone;

  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          leading: const BackButton(
            color: Color.fromRGBO(75, 75, 75, 1)
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 233, 233, 233),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width,
                  child: const Text('Inscription', textAlign: TextAlign.center, overflow: 
                  TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55, color: Color.fromRGBO(75, 75, 75, 1)),)
                ),
                
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Column(
                    children:[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: validText,
                        onSaved: (String ?val) {
                          firstname = val!;
                        },
                        decoration: InputDecoration(
                          labelText: 'NOM',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(75, 75, 75, 1)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                      Padding(
                        padding: new EdgeInsets.all(5.0),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: validText,
                        onSaved: (String ?val) {
                          lastname = val!;
                        },
                        decoration: InputDecoration(
                          labelText: 'PRENOM',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(75, 75, 75, 1)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                      Padding(
                        padding: new EdgeInsets.all(5.0),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                        onSaved: (String ?val) {
                          email = val!;
                        },
                        decoration: InputDecoration(
                          errorText: error ? 'cet email est deja utilisé' : null,
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(75, 75, 75, 1)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                      Padding(
                        padding: new EdgeInsets.all(5.0),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: validText,
                        onSaved: (String ?val) {
                          password = val!;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'MOT DE PASSE',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(75, 75, 75, 1)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                      Padding(
                        padding: new EdgeInsets.all(5.0),
                      ),
                      DateTimeField(
                        decoration: InputDecoration(
                          labelText: 'DATE DE NAISSANCE',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(75, 75, 75, 1)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                        validator: validDate,
                        onSaved: (DateTime ?val) {
                          date = val!;
                        },
                        format: datef,
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100)
                          );
                          if (date != null) {
                            final time = await showTimePicker(
                            context: context,
                            initialTime:
                              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                          );
                        return DateTimeField.combine(date, time);
                        } else {
                        return currentValue;
                          }
                        },
                      ),
                      Padding(
                        padding: new EdgeInsets.all(5.0),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: validateMobile,
                        onSaved: (String ?val) {
                          phone = val!;
                        },
                        decoration: InputDecoration(
                          labelText: 'TELEPHONE',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(75, 75, 75, 1)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                      Padding(
                        padding: new EdgeInsets.all(15.0),
                      ),
                      new SizedBox(
                        width: 350.0,
                        height: 40.0,
                        child: new ElevatedButton(onPressed: _validateInputs,
                          child: new Text("Je m'inscris", style: TextStyle(color: Colors.white) ),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(75, 75, 75, 1))),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromARGB(255, 233, 233, 233),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //--------------Validation Formulaire--------------------------
  String? validText(String ?value) {
    if (value!.isEmpty)
      return "Ce champs ne peut pas etre vide.";
    else
      return null;
  }

  String? validDate(DateTime ?value) {
    if (value == null)
      return "Ce champs ne peut pas etre vide.";
    else
      return null;
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      // If all data are correct then save data to out variables
      _formKey.currentState?.save();
      print(firstname);
      print(lastname);
      print(email);
      print(date);
      print(password);
      print(phone);
      _createNewUser(context);
    } else {
      // If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String? validateEmail(String ?value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value!)) return 'Email non valide';

    return null;
  }

  String? validateMobile(String? value) {
    if (value?.length != 10)
      return 'Numero non valide';
    else
      return null;
  }

  void _createNewUser(BuildContext context) async {
    // insertion d'une nouvelle image dans la bdd et retour a la liste d'image

    String id = Uuid().v4();

    int ?nb = await db.emailexist(email);
    if (nb! > 0) {
      setState(() {
        error = true;
      });
    } else {
      await db
          .insertUser(User(id, password, firstname, lastname, date.toString(),
                  phone, email)
              .toMap())
          .then((_) {
        Navigator.pop(context); // retour a la connexion
      });
    }
  }
}
