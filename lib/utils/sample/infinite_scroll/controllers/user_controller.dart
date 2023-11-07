
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/repositories/user_repository.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/models/user.dart';
class UserController extends GetxController{
  final UserRepositry _userRepositry = UserRepositry();
  final int _limit = 15;
  int _page = 1;
  RxString type = "1".obs;
  var hasMore = true.obs;
  var users = <User>[].obs;




  Future getUser() async{
    try{
      print("getUser ..............");
      String ty = type.toString();
      print("type : $ty");

      List<User> response = await _userRepositry.fetchUsers(_page, _limit, ty);
      if (response.length < _limit){
        hasMore.value = false;
      }

      print("response.length : ${response.length}");
      users.addAll(response.sublist(1, response.length));
  //    users.addAll(response);
      _page++;
    }catch(e){
      if (kDebugMode) print(e.toString());
    }
  }

  Future searchUser(String query) async{
    try{
      String ty = type.toString();
      List<User> response = await _userRepositry.searchUsers(_page, _limit, ty, query);
      if (response.length < _limit){
        hasMore.value = false;
      }

      print("Search length : ${response.length}");
      users.addAll(response.sublist(1, response.length));
      print(response);
      _page++;
    }catch(e){
      if (kDebugMode) print(e.toString());
    }
  }

  Future refreshData() async{
    _page = 1;
    hasMore.value = true;
    users.value = [];

    await getUser();
  }

}