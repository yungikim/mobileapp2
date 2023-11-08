import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/models/user_detail.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/models/user_detail2.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/repositories/user_repository.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/models/user.dart';

class UserController extends GetxController {
  final UserRepositry _userRepositry = UserRepositry();
  final int _limit = 15;
  int _page = 1;
  RxString type = "1".obs;
  var hasMore = true.obs;
  var users = <User>[].obs;
  // var userinfo = UserDetail(
  //   email: "",
  //   name: "",
  //   nickname: "",
  //   photoprofile: "",
  //   photoprofileversion: "",
  //   carerr: [],
  // ).obs;
  //UserDetail2 userInfo = EmptyUserDetail2.obs as UserDetail2;
  var userInfo = UserDetail2(nickname: "").obs;

  Future getUser() async {
    try {
      print("getUser ..............");
      String ty = type.toString();
      print("type : $ty");

      List<User> response = await _userRepositry.fetchUsers(_page, _limit, ty);
      if (response.length < _limit) {
        hasMore.value = false;
      }

      print("response.length : ${response.length}");
      users.addAll(response.sublist(1, response.length));
      //    users.addAll(response);
      _page++;
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
  }

  Future searchUser(String query) async {
    try {
      String ty = type.toString();
      List<User> response =
          await _userRepositry.searchUsers(_page, _limit, ty, query);
      if (response.length < _limit) {
        hasMore.value = false;
      }

      print("Search length : ${response.length}");
      users.addAll(response.sublist(1, response.length));
      print(response);
      _page++;
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
  }

  Future artistDetail(String email) async {
    try {
      print("artistDetail Start.......");
      print("email : ${email}");
      String response = await _userRepositry.artistDetail(email);
      print("***************");

      UserDetail2 userin = userDetailFromJson2(response);

      print("온다. 여기로....");
      print(userin.nickname);
      print(userin.photoimageProfile);
      print(userin.email);
      print(userin.photoimage);
      // print(userin.id);
      // print(userin.email);

      userInfo.value = userin;

      //UserDetail userInfo = userDetailFromJson(response);
      //userInfo = user;

     // print(response.nickname);

     // userInfo = response;

      //print(userInfo.nickname);


      // changeUserDetail(
      //   email: response.email.toString(),
      //   name: response.name.toString(),
      //   nickname: response.nickname.toString(),
      //   photoprofile: response.photoprofile.toString(),
      //   photoprofileversion: response.photoprofileversion.toString(),
      //   career: response.carerr,
      // );
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
  }

  // void changeUserDetail({
  //   required String email,
  //   required String name,
  //   required String nickname,
  //   required String photoprofile,
  //   required String photoprofileversion,
  //   required List<Career> career,
  // }) {
  //   userinfo.update((val) {
  //     val?.email = email;
  //     val?.name = name;
  //     val?.nickname = nickname;
  //     val?.photoimageProfile = photoprofile;
  //     val?.photoimageProfileVersion = photoprofileversion;
  //     val?.career = career;
  //   });
  // }

  Future refreshData() async {
    _page = 1;
    hasMore.value = true;
    users.value = [];

    await getUser();
  }
}
