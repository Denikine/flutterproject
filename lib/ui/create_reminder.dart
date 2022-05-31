// ignore_for_file: file_names
import 'package:project_flutter/ui/mediaQuery/size_helpers.dart';
import 'package:project_flutter/ui/widgets/labelText.dart';
import 'package:flutter/material.dart';
import 'package:textfield_datepicker/textfield_dateAndTimePicker.dart';
import 'package:intl/intl.dart';

class TextFieldDateTimePicker extends StatefulWidget {
  static const routeName = '/create_rappel';
  TextFieldDateTimePicker({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  _TextFieldDateTimePickerState createState() =>
      _TextFieldDateTimePickerState();
}

class _TextFieldDateTimePickerState extends State<TextFieldDateTimePicker> {
  final Map<String, dynamic> _formData = {'Title': null, 'Description': null};
  final _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String reminderTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 7,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            'Créer un rappel',
            style: TextStyle(
              fontSize: displayWidth(context) * 0.045,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Form(
            key: _formKey,
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
                      reminderTitle = val!;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Renseignez votre titre',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(101, 75, 75, 75)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const LabelText(
                  labelValue: "Date et heure du rappel",
                ),
                TextfieldDateAndTimePicker(
                  cupertinoDatePickerBackgroundColor: Colors.white,
                  cupertinoDatePickerMaximumDate: DateTime(2099),
                  cupertinoDatePickerMaximumYear: 2099,
                  cupertinoDatePickerMinimumYear: 1990,
                  cupertinoDatePickerMinimumDate: DateTime(1990),
                  cupertinoDateInitialDateTime: DateTime.now(),
                  materialDatePickerFirstDate: DateTime.now(),
                  materialDatePickerInitialDate: DateTime.now(),
                  materialDatePickerLastDate: DateTime(2099),
                  preferredDateFormat: DateFormat.yMMMEd(),
                  materialTimePickerUse24hrFormat: false,
                  cupertinoTimePickerMinuteInterval: 1,
                  cupertinoTimePickerUse24hFormat: false,
                  textfieldDateAndTimePickerController: _controller,
                  style: TextStyle(
                    fontSize: displayWidth(context) * 0.040,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  cursorColor: Colors.black,
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
                        fontSize: displayWidth(context) * 0.04,
                        fontWeight: FontWeight.normal),
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  materialInitialTime: TimeOfDay.now(),
                ),
                //ElevatedButton(onPressed: onPressed, child: child),
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
                ),
              ],
            ),
          ),
        )));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_formData);
    }
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        _submitForm();
      },
      child: const Text('SEND'),
    );
  }
}
