import 'package:flutterproject/RemindMe/mediaQuery/size_helpers.dart';
import 'package:flutterproject/RemindMe/widgets/labelText.dart';
import 'package:flutter/material.dart';
import 'rappel.dart';
import 'package:textfield_datepicker/textfield_dateAndTimePicker.dart';
import 'package:intl/intl.dart';

class FormDemo extends StatefulWidget {
  static String routeName = '/creation';
  const FormDemo({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _FormDemoState();
  }
}

class _FormDemoState extends State<FormDemo> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'Title': null, 'Description': null};
  final focusDescription = FocusNode();
  Rappel task = new Rappel();
  final TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Demo'),
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //_buildTitleField(),
        //_buildDescriptionField(),
        _buildDatepickerField(),
        _buildSubmitButton(),
      ],
    ));
  }

  // Widget _buildTitleField() {
  //   return TextFormField(
  //     decoration: const InputDecoration(labelText: 'Title'),
  //     validator: (String? value) {
  //       if (!RegExp(
  //               r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
  //           .hasMatch(value!)) {
  //         return "Ce n'est pas un titre valide";
  //       }
  //     },
  //     onSaved: (String? value) {
  //       _formData['Title'] = value;
  //     },
  //     textInputAction: TextInputAction.next,
  //     onFieldSubmitted: (v) {
  //       FocusScope.of(context).requestFocus(focusDescription);
  //     },
  //   );
  // }

  // Widget _buildDescriptionField() {
  //   return TextFormField(
  //     decoration: const InputDecoration(labelText: 'Description'),
  //     validator: (String? value) {
  //       if (value!.isEmpty) {
  //         return 'Preencha a senha';
  //       }
  //     },
  //     onSaved: (String? value) {
  //       _formData['Description'] = value;
  //     },
  //     focusNode: focusDescription,
  //     onFieldSubmitted: (v) {
  //       _submitForm();
  //     },
  //   );
  // }

  Widget _buildDatepickerField() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            //Expanded(
            //child: ListView(
            //children: [
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
        ));
    //)
    //]));
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        _submitForm();
      },
      child: const Text('SEND'),
    );
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_formData);
    }
  }
}
