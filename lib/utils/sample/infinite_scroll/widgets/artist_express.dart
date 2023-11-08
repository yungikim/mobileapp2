import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/controllers/user_controller.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/models/user_detail.dart';

class ArtistExpress extends StatelessWidget {
  ArtistExpress({super.key});

  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${_userController.userInfo.value.name}"),
            Text(_userController.userInfo.value.nameEng ?? ''),
            Text(_userController.userInfo.value.content ?? ''),
            Text("작가 노트"),
         //   Text(_userController.userInfo.value.content2 ?? ''),
            Text("학력 정보"),
            Text("${draw1()}"),
            Text(_userController.userInfo.value.education?[0].schoolname ?? ''),
          ],
        ),
      ),
    );
  }

  String draw1(){
    String res = "";
    if (_userController.userInfo.value.education != null){
      for (var i = 0 ; i < _userController.userInfo.value.education!.length; i++){
        var edu = _userController.userInfo.value.education![i];
        String school = edu.schoolname ?? '';
        String end = edu.end ?? '';
        String major = edu.major ?? '';
        String level = edu.level ?? '';
        res = "$res$end $school $major $level졸업\n";
      }
    }
    return res;
  }
}
