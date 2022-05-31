class Imagecamera {

  late String id;
  late String photoname;
  late String path;

  Imagecamera( this.id,this.path,this.photoname);

  Imagecamera.map(dynamic obj)
  {
    this.id = obj['id'];
    this.photoname = obj['photoname'];
    this.path= obj['path'];
  }

  Imagecamera.fromMap(Map<String,dynamic> map)
  {
    this.id = map['id'];
    this.photoname = map['photoname'];
    this.path= map['path'];
  }

  Map<String, dynamic> toMap()
  {
    var map = new Map<String, dynamic>();
    if (id != null) {
        map['id'] = id;
    }
    map['photoname'] = photoname;
    map['path'] = path;
    return map;
  }
}