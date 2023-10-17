
import 'package:mobileapp/utils/sample/kakao_login/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginModel{
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  KakaoLoginModel(this._socialLogin);

  Future login() async{
    print("kakao login");
    isLogined = await _socialLogin.login();
    if (isLogined){
      print("kakao logined......");
      user = await UserApi.instance.me();
      print(user);
    }
  }

  Future logout() async{
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }

}