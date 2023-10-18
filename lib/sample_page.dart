import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/login_sample.dart';
import 'package:mobileapp/utils/sample/login_sample/firebase_login.dart';
import 'package:mobileapp/utils/sample/login_sample2.dart';

import 'features/screens/splash/splashscreen.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Dev Sample"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){

              Get.to(()=> SplashScreen());
            }, child: Text("Splash Screen1")),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Get.to(()=> LoginSample2());
            }, child: Text("로그인 샘플1"))
          ],
        ),
      ),
    );
  }
}
