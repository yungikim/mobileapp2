import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:mobileapp/utils/sample/login_sample/auth_controller.dart';
import 'package:mobileapp/utils/sample/login_sample/firebase_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobileapp/utils/sample/login_sample/server_login_screen.dart';


//다양한 형태의 로그인 기능을 구현하는 샘플 메인 페이지입니다.
//Firebase 로그인 기능
//일반 서버 접속 로그인 기능

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  kakao.KakaoSdk.init(nativeAppKey: 'b518f7790732911b6fb384439e147353');
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget{
  const LoginApp({Key? key}) : super(key: key);



  // @override
  // void initState() {
  //   print("1111111111111111");
  //   //initSate에서 await를 사용할 수 없어 별도 일반 함수를 생성한다.
  //   inx();
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginAppSample(),
    );
  }
}

Future<void>  inx() async{

  //await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  Get.put(AuthController());
}

class LoginAppSample extends StatelessWidget {
  const LoginAppSample({Key? key}) : super(key: key);

  //sfl로 설정해야 initState를 사용할 수 있다.
  inx() {
    // TODO: implement inx
    throw UnimplementedError();
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

