class User{
  String? nickname, name, email, avatar;

  User({this.nickname, this.name, this.email, this.avatar});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      nickname: json['nickname'],
      name : json['name'],
      email : json['email'],
      avatar :  json['last_art_path'],
    );
  }
}