import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobileapp/login/boarding/on_boarding_screen.dart';
import 'package:mobileapp/login/login/login_screen.dart';
import 'package:mobileapp/view/main/main_screen.dart';

import '../common/data/data.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));
    // Get.to(() => const LinkScreen());
    checkToken();
  }


  checkToken() async {
    print("111111111111111111111");
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final dio = Dio();
    print("222222222222222222222");
    try {
      // final resp = await dio.post('http://$ip/auth/token',
      //     options: Options(headers: {'authorization': 'Bearer $refreshToken'}));
      // print("+++++++++++++++++++++++++++++++++");
      // print(resp);
      // print("+++++++++++++++++++++++++++++++++");
      // await storage.write(key: ACCESS_TOKEN_KEY, value: resp.data['accessToken']);

      //정상적으로 인증이 되면 메인 페이지로 이동한다.
      //pushAndRemoveUntil을 하면 뒤로가기를 제거해 준다.
      print("3333333333333333333333");
      Get.to(() => OnBoardingScreen());
    } catch (e) {
      print("444444444444444444");
      print(e);
      //만약 정상적으로 처리되지 않을 경우 로그인 페이지로 이동한다.
      Get.to(() => const LoginScreen());
    }
  }
}