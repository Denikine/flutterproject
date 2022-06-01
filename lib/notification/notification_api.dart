import 'package:flutter/material.dart';



int createUniqueId()
{
  return DateTime.now().millisecondsSinceEpoch.remainder((100000));
}

class NotificationWeekAndTime{
  final int dayofTheWeek;
  final TimeOfDay timeOfDay;
  
  NotificationWeekAndTime({
      required this.dayofTheWeek,
      required this.timeOfDay,
  });
}
