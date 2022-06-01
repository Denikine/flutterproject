import 'package:flutter/material.dart';
import 'package:project_flutter/ui/principale.dart';
import 'package:project_flutter/modele/reminder.dart';
import 'package:project_flutter/modele/database_helper.dart';

class ReminderDetail extends StatelessWidget {
  final Reminder reminder1;
  const ReminderDetail({Key? key, required this.reminder1}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55.0), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 233, 233, 233),
          leading: const BackButton(color: Color.fromRGBO(75, 75, 75, 1)),
          centerTitle: true,
          title: Text(
            reminder1.title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis, // to remove the overflow
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromRGBO(75, 75, 75, 1)),
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.delete,
                    color: Color.fromRGBO(75, 75, 75, 1), size: 24),
                onPressed: () {
                  DatabaseHelper db = DatabaseHelper.instance;
                  db.deleteReminder(this.reminder1.id);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => principale(
                                content: '',
                                title: '',
                              )),
                      ModalRoute.withName('/principale'));
                }),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: const [
              SizedBox(
                width: 40,
              ),
              Text(
                'Date : ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(75, 75, 75, 1),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Text(
                reminder1.date,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(75, 75, 75, 1),
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 40,
            endIndent: 40,
            color: Color.fromARGB(52, 138, 138, 138),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: const [
              SizedBox(
                width: 40,
              ),
              Text(
                'Heure : ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(75, 75, 75, 1),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Text(
                reminder1.date,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(75, 75, 75, 1),
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 40,
            endIndent: 40,
            color: Color.fromARGB(52, 138, 138, 138),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: const [
              SizedBox(
                width: 40,
              ),
              Text(
                'Commentaire : ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(75, 75, 75, 1),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Text(
                reminder1.comment,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(75, 75, 75, 1),
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 40,
            endIndent: 40,
            color: Color.fromARGB(52, 138, 138, 138),
          ),
          // Text(reminder1.comment),
          // Text(reminder1.date),
          // Text(reminder1.time)
        ],
      ),
    );
  }
}
