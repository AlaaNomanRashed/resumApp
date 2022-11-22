class ExperienceModel{
  late int id;
  late String name;
  late String type;
  late String body;

  ExperienceModel();

  ExperienceModel.fromMap(Map<String,dynamic> map){
    id = map['id'];
    name = map['name'];
    type = map['type'];
    body = map['body'];
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = <String,dynamic>{};
    map['name'] = name;
    map['type'] = type;
    map['body'] = body;
    return map;
  }

}