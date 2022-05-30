class User {

  late String id;
  late String password;
  late String firstname;
  late String lastname;
  late String birthdate;
  late String phone;
  late String email;

  User( this.id,this.password,this.firstname,this.lastname,this.birthdate,this.phone,this.email);

  User.map(dynamic obj)
  {
    this.id = obj['id'];
    this.password = obj['password'];
    this.firstname= obj['firstname'];
    this.lastname= obj['lastname'];
    this.birthdate= obj['birthdate'];
    this.phone= obj['phone'];
    this.email= obj['email'];

  }

  User.fromMap(Map<String,dynamic> map)
  {
    this.id = map['id'];
    this.password = map['password'];
    this.firstname= map['firstname'];
    this.lastname= map['lastname'];
    this.birthdate= map['birthdate'];
    this.phone= map['phone'];
    this.email= map['email'];
  }

  Map<String, dynamic> toMap()
  {
    var map = new Map<String, dynamic>();
    if (id != null) {
        map['id'] = id;
    }
    map['password'] = password;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['birthdate'] = birthdate;
    map['phone'] = phone;
    map['email'] = email;

    return map;
  }
}