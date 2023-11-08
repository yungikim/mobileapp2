import 'dart:convert';

UserDetail2 userDetailFromJson2(String str) =>
    UserDetail2.fromJson(json.decode(str));

// String userDetailToJson2(UserDetail2 data) => json.encode(data.toJson());

class UserDetail2 {
  String nickname ="";
  // ID id;
  // String email;
  // String? gubun;
  // String? site;
  // String? welcomeId;
  // String name;
  // String? gender;
  // String? sortdate;
  // int? artCount;
  // int? vrCount;
  // String? shortUrl;
  // String? status;
  // String? artistkey;
  // String? emailAuth;
  // int? random;
  // String? photoimage;
  // String? photoimageVersion;
  // String? photoimageList;
  // String? photoimageListVersion;
  // String? photoimageProfile;
  // String? photoimageProfileVersion;
  // String? nameEng;
  // String? birth;
  // String? content;
  // String? content2;
  // String? curnickname;
    List<Group>? group;
  // List<Education>? education;
  // List<Career>? career;
  // List<Cert>? cert;
  // List<Career>? display;
  // String? summary;
  // String? lastArtPath;
  // String? autoupload;
  // String? mode;

  UserDetail2({
    required this.nickname,
    // required this.id,
    // required this.email,
    // this.gubun,
    // this.site,
    // this.welcomeId,
    // required this.name,
    //  this.gender,
    //  this.sortdate,
    //  this.artCount,
    //  this.vrCount,
    //  this.shortUrl,
    //  this.status,
    //  this.artistkey,
    //  this.emailAuth,
    //  this.random,
    //  this.photoimage,
    //  this.photoimageVersion,
    //  this.photoimageList,
    //  this.photoimageListVersion,
    //  this.photoimageProfile,
    //  this.photoimageProfileVersion,
    //  this.nameEng,
    //  this.curnickname,
    //  this.birth,
    //  this.content,
    //  this.content2,
        this.group,
    //  this.education,
    //  this.career,
    //  this.cert,
    //  this.display,
    //  this.summary,
    //  this.lastArtPath,
    //  this.autoupload,
    //  this.mode,

  });

  UserDetail2.fromJson(Map<String, dynamic> json){
    nickname = json['nickname'];
    if (json["group"] != null){
      group = List<Group>.from(json["group"].map((x) => Group.fromJson(x)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    if (group != null){
      data['group'] = List<dynamic>.from(group!.map((x) => x.toJson()));
    }
    return data;
  }

  // factory UserDetail2.fromJson(Map<String, dynamic> json) => UserDetail2(
  //       nickname: json['nickname'],
  //       email: json['email'],
  //       id: ID.fromJson(json["_id"]),
  //       gubun: json['gubun'],
  //       site: json['site'],
  //       welcomeId: json['welcomeId'],
  //       name: json['name'],
  //       gender: json["gender"],
  //       sortdate: json["sortdate"],
  //       artCount: json["art_count"],
  //       vrCount: json["vr_count"],
  //       shortUrl: json["short_url"],
  //       status: json["status"],
  //       artistkey: json["artistkey"],
  //       emailAuth: json["email_auth"],
  //       random: json["random"],
  //       photoimage: json["photoimage"],
  //       photoimageVersion: json["photoimage_version"],
  //       photoimageList: json["photoimage_list"],
  //       photoimageListVersion: json["photoimage_list_version"],
  //       photoimageProfile: json["photoimage_profile"],
  //       photoimageProfileVersion: json["photoimage_profile_version"],
  //       nameEng: json["name_eng"],
  //       curnickname: json["curnickname"],
  //       birth: json["birth"],
  //       content: json["content"],
  //       content2: json["content2"],
  //
  //       // group: List<Group>.from(json["group"].map((x) => Group.fromJson(x))),
  //       // education: List<Education>.from(
  //       //     json["education"].map((x) => Education.fromJson(x))),
  //       // career: List<Career>.from(
  //       //     json["career"].map((x) => Career.fromJson(x))),
  //       // cert: List<Cert>.from(json['cert'].map((x) => Cert.fromJson(x))),
  //       // display: List<Career>.from(
  //       //     json['display'].map((x) => Career.fromJson(x))),
  //       summary: json["summary"],
  //       lastArtPath: json["last_art_path"],
  //       autoupload: json["autoupload"],
  //       mode: json["mode"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "nickname": nickname,
  //       "email": email,
  //       "_id": id,
  //       "gubun" : gubun,
  //       "site" : site,
  //       "welcomeId" : welcomeId,
  //       "name" : name,
  //       "gender": gender,
  //       "sortdate": sortdate,
  //       "art_count": artCount,
  //       "vr_count": vrCount,
  //       "short_url": shortUrl,
  //       "status": status,
  //       "artistkey": artistkey,
  //       "email_auth": emailAuth,
  //       "random": random,
  //       "photoimage": photoimage,
  //       "photoimage_version": photoimageVersion,
  //       "photoimage_list": photoimageList,
  //       "photoimage_list_version": photoimageListVersion,
  //       "photoimage_profile": photoimageProfile,
  //       "photoimage_profile_version": photoimageProfileVersion,
  //       "name_eng": nameEng,
  //       "curnickname": curnickname,
  //       "birth": birth,
  //       "content": content,
  //       "content2": content2,
  //       "group": List<dynamic>.from(group.map((x) => x.toJson())),
  //       // "education": List<dynamic>.from(education.map((x) => x.toJson())),
  //       // "career": List<dynamic>.from(career.map((x) => x.toJson())),
  //       // "cert": List<dynamic>.from(cert.map((x) => x.toJson())),
  //       // "display": List<dynamic>.from(career.map((x) => x.toJson())),
  //       "summary": summary,
  //       "last_art_path": lastArtPath,
  //       "autoupload": autoupload,
  //       "mode": mode,
  //     };
}



class Career {
  String term;
  String title;

  Career({
    required this.term,
    required this.title,
  });

  factory Career.fromJson(Map<String, dynamic> json) =>
      Career(
        term: json['term'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() =>
      {
        "term": term,
        "title": title,
      };
}

class Cert {
  String certname;

  Cert({
    required this.certname,
  });

  factory Cert.fromJson(Map<String, dynamic> json) =>
      Cert(
        certname: json['certname'],
      );

  Map<String, dynamic> toJson() =>
      {
        "certname": certname,
      };
}

class Education {
  String level;
  String status;
  String schoolname;
  String major;
  String start;
  String end;

  Education({
    required this.level,
    required this.status,
    required this.schoolname,
    required this.major,
    required this.start,
    required this.end,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      Education(
        level: json['level'],
        status: json['status'],
        schoolname: json['schoolname'],
        major: json['major'],
        start: json['start'],
        end: json['end'],
      );

  Map<String, dynamic> toJson() =>
      {
        "level": level,
        "status": status,
        "schoolname": schoolname,
        "major": major,
        "start": start,
        "end": end,
      };
}

class Group {
  String title;
  String dept;
  String jobtitle;

  Group({
    required this.title,
    required this.dept,
    required this.jobtitle,
  });

  factory Group.fromJson(Map<String, dynamic> json) =>
      Group(
        title: json["title"],
        dept: json['dept'],
        jobtitle: json['jobtitle'],
      );

  Map<String, dynamic> toJson() =>
      {
        "title": title,
        "dept": dept,
        "jobtitle": jobtitle,
      };
}

class ID {
  String oid;

  ID({
    required this.oid,
  });

  factory ID.fromJson(Map<String, dynamic> json) => ID(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}


UserDetail2 EmptyUserDetail2() {

  return UserDetail2(
    // id: ID(oid: ""),
    // email: "",
    nickname: "",
    // gubun: "",
    // site: "",
    // welcomeId: "",
    // name: "",
  );
}