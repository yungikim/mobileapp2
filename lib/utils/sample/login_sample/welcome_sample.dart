import 'package:flutter/material.dart';
import 'package:mobileapp/utils/sample/login_sample/auth_controller.dart';

class WelcomeSample extends StatelessWidget {
  String email;
  WelcomeSample({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? ur = AuthController.instance.auth.currentUser?.email;

    print("ur : " + ur!);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("로그인 되면 여기로 온다."),
            Text("로그인 이메일 : ${email}"),
            ElevatedButton(onPressed: (){
              AuthController.instance.logOut();
            }, child: Text("로그아웃"))
          ],
        ),
      ),
    );
  }
}
