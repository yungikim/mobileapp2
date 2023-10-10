import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/utils/sample/login_sample/auth_controller.dart';
import 'package:mobileapp/utils/sample/login_sample/firebase_login.dart';
import 'package:firebase_core/firebase_core.dart';


//다양한 형태의 로그인 기능을 구현하는 샘플 메인 페이지입니다.
//Firebase 로그인 기능
//일반 서버 접속 로그인 기능

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginAppSample(),
    );
  }
}

class LoginAppSample extends StatelessWidget {
  const LoginAppSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(()=> FireBaseLogin());
            }, child: Text("클릭"))
          ],
        ),
      ),
    );
  }
}

