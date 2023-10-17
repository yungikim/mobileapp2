import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/login_sample/auth_controller.dart';
import 'package:mobileapp/utils/sample/kakao_login/kakao_login.dart';
import 'package:mobileapp/utils/sample/kakao_login/kakao_login_view.dart';
import 'package:mobileapp/utils/sample/login_sample/server_login.dart';

class FireBaseLogin extends StatelessWidget{
  const FireBaseLogin({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
  //  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
    //  SimpleController controller = Get.put(SimpleController());

   // AuthController controller = Get.put(AuthController());

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    final ServerLoginController slc = new ServerLoginController();

    return Scaffold(
      appBar: AppBar(
        title: Text("파이어베이스 로그인"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.deepOrange,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ))),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.deepOrange,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ))),
            ),
            ElevatedButton(
                onPressed: () {
                  AuthController.instance
                      .register(emailController.text, passwordController.text);
                },
                child: Text("Firebase 아이디 만들기")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  AuthController.instance
                      .logIn(emailController.text, passwordController.text);
                },
                child: Text("Firebase 로그인")),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  AuthController.instance
                      .signInWithGoogle(context);
                },
                child: Text("구글 로그인")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  AuthController.instance.singPhone();
                },
                child: Text("전화번호 로그인")),
            ElevatedButton(onPressed: (){
              Get.to(()=> KakaoLoginView());
            }, child: Text("카카오톡 로그인"))
          ],
        ),
      ),
    );
  }
}
