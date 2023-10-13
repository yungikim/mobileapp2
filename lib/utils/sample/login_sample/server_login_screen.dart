import 'package:flutter/material.dart';
import 'package:mobileapp/utils/sample/login_sample/server_login.dart';

class ServerLoginScreen extends StatelessWidget {
  const ServerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    final ServerLoginController slc = new ServerLoginController();

    return Scaffold(
      appBar: AppBar(
        title: Text("서버 로그인 하기"),
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

            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  // AuthController.instance
                  //     .register(emailController.text, passwordController.text);
                },
                child: Text("서버 로그인 아이디 만들기")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  slc.login(emailController.text, passwordController.text);
                },
                child: Text("서버 로그인"))
          ],
        ),
      ),
    );
  }
}
