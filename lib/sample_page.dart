import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/login_sample.dart';

import 'features/screens/splash/splashscreen.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.to(()=> SplashScreen());
            }, child: Text("Splash Screen1")),

            ElevatedButton(onPressed: (){
              Get.to(()=> LoginAppSample());
            }, child: Text("로그인 샘플1"))
          ],
        ),
      ),
    );
  }
}
