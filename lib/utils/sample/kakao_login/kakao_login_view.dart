import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/kakao_login/kakao_login_model.dart';
import 'package:mobileapp/utils/sample/kakao_login/social_login.dart';
import 'package:mobileapp/utils/sample/login_sample/auth_controller.dart';
import '../../GetX/reactiveX/controller.dart';
import 'kakao_control.dart';
import 'kakao_login.dart';



class KakaoLoginView extends StatelessWidget {
  KakaoLoginView({super.key});

  final kakaoModel = KakaoLoginModel(KakaoLogin());
  final KakoControl ka = Get.put(KakoControl());



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("카카오 로그인"),
      ),
      body: Center(

        child: Column(

          children: [
            ElevatedButton(onPressed: () async{

              await kakaoModel.login();
              print(kakaoModel.user?.kakaoAccount?.email);
              String? kemail = kakaoModel.user?.kakaoAccount?.email;
              ka.changeEmail(kemail!);

              // loginmail = kakaoModel.user?.kakaoAccount?.email;
              // setState(() {
              //
              // });
            }, child: Text("카카오 로그인")),
            ElevatedButton(onPressed: () async{
              await kakaoModel.logout();
              ka.changeEmail("");
              // loginmail = "";
              // setState(() {
              //
              // });
            }, child: Text("로그 아웃")),
            Obx(() => Text("${ka.kemail.value}")),
            Text("${Get.find<KakoControl>().kemail}")
          ],
        ),
      ),
    );
  }
}
