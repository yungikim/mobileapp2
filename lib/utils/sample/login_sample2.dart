import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'login_sample/auth_controller.dart';
import 'login_sample/firebase_login.dart';
import 'login_sample/server_login_screen.dart';

class LoginSample2 extends StatefulWidget {
  const LoginSample2({super.key});

  @override
  State<LoginSample2> createState() => _LoginSample2State();

}

Future<void>  inx() async{
  print("여기로 온다....");
  //await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  Get.put(AuthController());
}

class _LoginSample2State extends State<LoginSample2> {

  @override
  void initState(){
    print("시작합니다................");
    inx();
   // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인 샘플"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(()=> FireBaseLogin());
            }, child: Text("파이어베이스 로그인 하기")),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Get.to(()=> ServerLoginScreen());
            }, child: Text("서버 로그인 하기"))
          ],
        ),
      ),
    );
  }
}

