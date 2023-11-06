class User{
  String? nickname, name, email, avatar, ename;
  int? artcount, vrcount;

  User({this.nickname, this.name, this.email, this.avatar, this.ename, this.artcount, this.vrcount});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      nickname: json['nickname'],
      name : json['name'],
      email : json['email'],
      avatar :  json['last_art_path'],
      ename : json['name_eng'],
      artcount : json['art_count'],
      vrcount: json['vr_count'],
    );
  }
}