import 'package:flutter/material.dart';
import 'package:project_flutter/ui/principale.dart';
import 'package:project_flutter/modele/reminder.dart';

class ReminderDetail extends StatelessWidget {
  final Reminder1 reminder1;
  const ReminderDetail({Key? key, required this.reminder1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromRGBO(75, 75, 75, 1)),
          ),
        ),
      ),
      body: Column(
        children: [
          Text(reminder1.comment),
          Text(reminder1.date),
          Text(reminder1.time)
        ],
      ),
    );
  }
}
