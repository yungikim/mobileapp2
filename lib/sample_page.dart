import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/http_json/json_parse.dart';
import 'package:mobileapp/utils/sample/http_json/listview_sample2.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/pages/user_home.dart';
import 'package:mobileapp/utils/sample/login_sample.dart';
import 'package:mobileapp/utils/sample/login_sample/firebase_login.dart';
import 'package:mobileapp/utils/sample/login_sample2.dart';
import 'package:mobileapp/utils/sample/ui/html_webview.dart';
import 'package:mobileapp/utils/sample/ui/multi_image_select.dart';
import 'package:mobileapp/utils/sample/ui/navigation_bar.dart';

import 'features/screens/splash/splashscreen.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Dev Sample"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const SplashScreen());
                  },
                  child: const Text("Splash Screen1")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const LoginSample2());
                  },
                  child: const Text("로그인 샘플1")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const Jsonparse());
                },
                child: const Text("http JSON"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const ListViewSample2());
                },
                child: const Text("List view sample2"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const MyHomeScroll(title: 'Infinite Scroll'));
                },
                child: const Text("Infinite Scroll"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => NavSample());
                  },
                  child: const Text("Navigation bar")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => MyApp());
                },
                child: const Text("html webview"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const MultiImageSelect());
                },
                child: const Text("Image Multi select"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
