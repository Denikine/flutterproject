class Imagecamera {

  late String id;
  late String photoname;
  late String url;

  Imagecamera( this.id,this.photoname,this.url);

  Imagecamera.map(dynamic obj)
  {
    this.id = obj['id'];
    this.photoname = obj['photoname'];
    this.url= obj['url'];
  }

  Imagecamera.fromMap(Map<String,dynamic> map)
  {
    this.id = map['id'];
    this.photoname = map['photoname'];
    this.url= map['url'];
  }

  Map<String, dynamic> toMap()
  {
    var map = new Map<String, dynamic>();
    if (id != null) {
        map['id'] = id;
    }
    map['photoname'] = photoname;
    map['url'] = url;
    return map;
  }
}