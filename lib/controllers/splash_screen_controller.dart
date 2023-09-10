import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobileapp/features/screens/welcome/welcome_screen.dart';
import 'package:mobileapp/features/screens/on_boarding/on_boarding_screen.dart';
import 'package:mobileapp/view/main/main_screen.dart';

import '../common/data/data.dart';
import '../features/screens/login/login_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    // Get.to(() => const LinkScreen());
    checkToken();
  }


  checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final dio = Dio();
    try {
      // final resp = await dio.post('http://$ip/auth/token',
      //     options: Options(headers: {'authorization': 'Bearer $refreshToken'}));
      // print("+++++++++++++++++++++++++++++++++");
      // print(resp);
      // print("+++++++++++++++++++++++++++++++++");
      // await storage.write(key: ACCESS_TOKEN_KEY, value: resp.data['accessToken']);

      //정상적으로 인증이 되면 메인 페이지로 이동한다.
      //pushAndRemoveUntil을 하면 뒤로가기를 제거해 준다.
      //Get.to(() => OnBoardingScreen());
      //Get.off(() => OnBoardingScreen());
      //Get.off(() => WelcomeScreen(), transition: Transition.fadeIn, duration: Duration(seconds: 2));
      Get.off(() => const OnBoardingScreen(), transition: Transition.fadeIn, duration: const Duration(seconds: 2));
    } catch (e) {
      print(e);
      //만약 정상적으로 처리되지 않을 경우 로그인 페이지로 이동한다.
      Get.to(() => const LoginScreen());
    }
  }
}