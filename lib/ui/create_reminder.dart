// ignore_for_file: file_names
import 'package:project_flutter/ui/mediaQuery/size_helpers.dart';
import 'package:project_flutter/ui/widgets/labelText.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:project_flutter/modele/database_helper.dart';
import 'package:textfield_datepicker/textfield_dateAndTimePicker.dart';
import 'package:intl/intl.dart';
import 'package:project_flutter/modele/reminder.dart';
import 'package:project_flutter/notification/notification.dart';
import 'package:project_flutter/ui/principale.dart';

class TextFieldDateTimePicker extends StatefulWidget {
  static const routeName = '/create_rappel';
  TextFieldDateTimePicker({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  _TextFieldDateTimePickerState createState() =>
      _TextFieldDateTimePickerState();
}

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
String string = dateFormat.format(DateTime.now());

class _TextFieldDateTimePickerState extends State<TextFieldDateTimePicker> {
  DatabaseHelper db = DatabaseHelper.instance;
  final Map<String, dynamic> _formData = {'Title': null, 'Description': null};
  final _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String title, comment;
  late DateTime date = DateTime.now();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 233, 233),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(75, 75, 75, 1),
          elevation: 7,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            'Créer un rappel',
            style: TextStyle(
              fontSize: displayWidth(context) * 0.045,
              color: Color.fromARGB(255, 233, 233, 233),
              //selectedItemColor: const Color.fromARGB(255, 233, 233, 233),
              //unselectedItemColor: const Color.fromARGB(255, 233, 233, 233),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Form(
            key: _formKey, // to validate the form
            child: Column(
              children: [
                Padding(
                  padding: new EdgeInsets.all(5.0),
                ),
                const SizedBox(
                  height: 60,
                ),
                const LabelText(labelValue: "Titre du rappel"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 320,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    //validator: validText,
                    onSaved: (String? val) {
                      title = val!;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Renseignez votre titre',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          //fontWeight: FontWeight.bold,
                          color: Color.fromARGB(55, 75, 75, 75)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(55, 75, 75, 75)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const LabelText(
                  labelValue: "Date et heure",
                ),
                Container(
                  width: 320,
                  child: TextfieldDateAndTimePicker(
                    cupertinoDatePickerBackgroundColor: Color.fromARGB(255, 233, 233, 233),
                    cupertinoDatePickerMaximumDate: DateTime(2099),
                    cupertinoDatePickerMaximumYear: 2099,
                    cupertinoDatePickerMinimumYear: 1990,
                    cupertinoDatePickerMinimumDate: DateTime(1990),
                    cupertinoDateInitialDateTime: DateTime.now(),
                    materialDatePickerFirstDate: DateTime.now(),
                    materialDatePickerInitialDate: DateTime.now(),
                    materialDatePickerLastDate: DateTime(2099),
                    preferredDateFormat: DateFormat.yMd(),
                    materialTimePickerUse24hrFormat: true,
                    cupertinoTimePickerMinuteInterval: 1,
                    cupertinoTimePickerUse24hFormat: true,
                    textfieldDateAndTimePickerController: _controller,
                    style: TextStyle(
                      fontSize: displayWidth(context) * 0.040,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: Colors.black,
                    onSaved: (String? val) {
                      String? temporaire = val?.replaceAll("/", "-");
                      temporaire=temporaire!.substring(0, temporaire.length - 1);
                      temporaire = "$temporaire:00";
                      date = new DateFormat('MM-dd-yyyy HH:mm:ss').parse(temporaire);
                    },
                    decoration: InputDecoration(
                      //errorText: errorTextValue,
                      helperStyle: TextStyle(
                          fontSize: displayWidth(context) * 0.031,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 0,
                            color: Colors.white,
                          )),
                      hintText: 'Sélectionner la date',
                      hintStyle: TextStyle(
                          fontSize: displayWidth(context) * 0.03,
                          fontWeight: FontWeight.normal),
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    materialInitialTime: TimeOfDay.now(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const LabelText(labelValue: "Commentaire"),
                Container(
                  width: 320,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    //validator: validText,
                    onSaved: (String? val) {
                      comment = val!;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Renseignez votre commentaire',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          //fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(75, 75, 75, 1)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(55, 75, 75, 75)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //ElevatedButton(onPressed: onPressed, child: child),
                TextButton(
                  //backgroundColor: const Color.fromRGBO(75, 75, 75, 1),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  child: const Text(
                    "Enregistrer",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromRGBO(75, 75, 75, 1),
                    ),
                  ),
                ),
                SizedBox(height: 40, width: 220, child: _buildSubmitButton())
              ],
            ),
          ),
        )));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _createNewReminder(context);
      //print(_formData);

      //_sendform(context);
    }
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(75, 75, 75, 1))),
      onPressed: () {
        _submitForm();
      },
      child: const Text('Enregistrer'),
    );
  }

  void _createNewReminder(BuildContext context) async {
    // insertion d'une nouvelle image dans la bdd et retour a la liste d'image

    String id = Uuid().v4();
    String string = dateFormat.format(date);
    int? nb = await db.titleexist(title);
    if (nb! > 0) {
      setState(() {
        error = true;
      });
    } else {
      await db
          .insertReminder(Reminder(id, title, string, comment).toMap())
          .then((_) {
        createReminderNotification(date, title, comment);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => principale(content: '', title: '',)), 
        ModalRoute.withName('/principale'));
      });
    }
  }

  // void _sendform(BuildContext context) async {
  //   // insertion d'une nouvelle image dans la bdd et retour a la liste d'image

  //   String id = Uuid().v4();

  //   int? nb = await db.emailexist(title);
  //   if (nb! > 0) {
  //     setState(() {
  //       error = true;
  //     });
  //   } else {
  //     await db
  //         .insertReminder(
  //             Reminder(id, title, date.toString(), time.toString(), comment)
  //                 .toMap())
  //         .then((_) {
  //       Navigator.pop(context); // retour a la connexion
  //     });
  //   }
  // }
}
