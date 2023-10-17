
import 'package:get/get.dart';

class KakoControl{
  RxString kakaoemail = "".obs;
  RxString get kemail => kakaoemail;

  void changeEmail(String email){
    print("이메일 변경하러 왔다 : ${email}");
    kakaoemail(email);
  }
}