import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/controllers/splash_screen_controller.dart';
import '../../common/data/data.dart';
import '../../view/main/main_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // bool animate = false;
  final splashscreenController = Get.put(SplashScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //init에서 await를 사용할 수 없어 일반 함수로 생성한다.
    splashscreenController.startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: splashscreenController.animate.value ? -40 : -70,
              left: splashscreenController.animate.value ? -40 : -70,
              width: 150,
              child: Image(
                image: AssetImage("asset/images/splash_images/water.png"),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: splashscreenController.animate.value ? 40 : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashscreenController.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ".appable/",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text("Learn To Code. \nFree For Everyone",
                        style: TextStyle(
                            fontFamily: 'Notosans',
                            fontSize: 20,
                            fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashscreenController.animate.value ? 150 : 0,
              left: 15,
              width: 320,
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashscreenController.animate.value ? 1 : 0,
                  child: Image(
                    image: AssetImage("asset/images/splash_images/back1.png"),
                  )),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashscreenController.animate.value ? 20 : 0,
              right: 20,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashscreenController.animate.value ? 1 : 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.lightBlueAccent),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
