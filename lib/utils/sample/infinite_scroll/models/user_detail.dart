import 'dart:convert';

import 'package:mobileapp/utils/sample/infinite_scroll/models/user_detail2.dart';

UserDetail userDetailFromJson(String str) =>
    UserDetail.fromJson(json.decode(str));

String userDetailToJson(UserDetail data) => json.encode(data.toJson());

class UserDetail {
  ID id;
  String email;
  String nickname;
  String gubun;
  String site;
  String welcomeId;
  String name;
  String gender;
  String sortdate;
  int artCount;
  int vrCount;
  String shortUrl;
  String status;
  String artistkey;
  String emailAuth;
  int random;
  String photoimage;
  String photoimageVersion;
  String photoimageList;
  String photoimageListVersion;
  String photoimageProfile;
  String photoimageProfileVersion;
  String nameEng;
  String birth;
  String content;
  String content2;
  String curnickname;
  List<Group> group;
  List<Education> education;
  List<Career> career;
  List<Cert> cert;
  List<Career> display;
  String summary;
  String lastArtPath;
  String autoupload;
  String mode;

  UserDetail({
    required this.id,
    required this.email,
    required this.nickname,
    required this.gubun,
    required this.site,
    required this.welcomeId,
    required this.name,
    required this.gender,
    required this.sortdate,
    required this.artCount,
    required this.vrCount,
    required this.shortUrl,
    required this.status,
    required this.artistkey,
    required this.emailAuth,
    required this.random,
    required this.photoimage,
    required this.photoimageVersion,
    required this.photoimageList,
    required this.photoimageListVersion,
    required this.photoimageProfile,
    required this.photoimageProfileVersion,
    required this.nameEng,
    required this.curnickname,
    required this.birth,
    required this.content,
    required this.content2,
    required this.group,
    required this.education,
    required this.career,
    required this.cert,
    required this.display,
    required this.summary,
    required this.lastArtPath,
    required this.autoupload,
    required this.mode,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      UserDetail(
        id: ID.fromJson(json["_id"]),
        email: json["email"],
        nickname: json["nickname"],
        gubun: json["gubun"],
        site: json["site"],
        welcomeId: json["id"],
        name: json["name"],
        gender: json["gender"],
        sortdate: json["sortdate"],
        artCount: json["art_count"],
        vrCount: json["vr_count"],
        shortUrl: json["short_url"],
        status: json["status"],
        artistkey: json["artistkey"],
        emailAuth: json["email_auth"],
        random: json["random"],
        photoimage: json["photoimage"],
        photoimageVersion: json["photoimage_version"],
        photoimageList: json["photoimage_list"],
        photoimageListVersion: json["photoimage_list_version"],
        photoimageProfile: json["photoimage_profile"],
        photoimageProfileVersion: json["photoimage_profile_version"],
        nameEng: json["name_eng"],
        curnickname: json["curnickname"],
        birth: json["birth"],
        content: json["content"],
        content2: json["content2"],
        group: List<Group>.from(json["group"].map((x) => Group.fromJson(x))),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        career: List<Career>.from(
            json["career"].map((x) => Career.fromJson(x))),
        cert: List<Cert>.from(json['cert'].map((x) => Cert.fromJson(x))),
        display: List<Career>.from(
            json['display'].map((x) => Career.fromJson(x))),
        summary: json["summary"],
        lastArtPath: json["last_art_path"],
        autoupload: json["autoupload"],
        mode: json["mode"],
      );

  Map<String, dynamic> toJson() =>
      {
        "_id": id.toJson(),
        "email": email,
        "nickname": nickname,
        "gubun": gubun,
        "site": site,
        "id": welcomeId,
        "name": name,
        "gender": gender,
        "sortdate": sortdate,
        "art_count": artCount,
        "vr_count": vrCount,
        "short_url": shortUrl,
        "status": status,
        "artistkey": artistkey,
        "email_auth": emailAuth,
        "random": random,
        "photoimage": photoimage,
        "photoimage_version": photoimageVersion,
        "photoimage_list": photoimageList,
        "photoimage_list_version": photoimageListVersion,
        "photoimage_profile": photoimageProfile,
        "photoimage_profile_version": photoimageProfileVersion,
        "name_eng": nameEng,
        "curnickname": curnickname,
        "birth": birth,
        "content": content,
        "content2": content2,
        "group": List<dynamic>.from(group.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "career": List<dynamic>.from(career.map((x) => x.toJson())),
        "cert": List<dynamic>.from(cert.map((x) => x.toJson())),
        "display": List<dynamic>.from(career.map((x) => x.toJson())),
        "summary": summary,
        "last_art_path": lastArtPath,
        "autoupload": autoupload,
        "mode": mode,
      };
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

  factory ID.fromJson(Map<String, dynamic> json) =>
      ID(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() =>
      {
        "\u0024oid": oid,
      };
}





