class Reminder {
  late String id;
  late String title;
  late DateTime date;
  late String comment;

  Reminder(this.id, this.title, this.date, this.comment);

  Reminder.map(dynamic obj) {
    this.id = obj['id'];
    this.title = obj['title'];
    this.date = obj['date'];
    this.comment = obj['comment'];
  }

  Reminder.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.date = map['date'];
    this.comment = map['comment'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['date'] = date;
    map['comment'] = comment;

    return map;
  }
}
