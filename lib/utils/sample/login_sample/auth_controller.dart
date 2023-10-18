
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobileapp/features/screens/app/main_screen.dart';
import 'package:mobileapp/features/screens/login/login_screen.dart';
import 'package:mobileapp/utils/sample/login_sample.dart';
import 'package:mobileapp/utils/sample/login_sample/firebase_login.dart';
import 'package:mobileapp/utils/sample/login_sample/phone.dart';
import 'package:mobileapp/utils/sample/login_sample/welcome_sample.dart';
import 'package:mobileapp/utils/sample/login_sample2.dart';


class AuthController extends GetxController{
  //AuthController.instance ...
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  static String verify = "";
  String kakaoemail = "";

  @override
  void onReady(){
    print("온 레디로 온다.............................");
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    print("init로 들어왔다.");

    if (user == null){
      print("Login page");
      Get.to(()=> LoginSample2());
    }else{
      print("메인으로 이동해야 한다.");
      print(user.phoneNumber);
      String email = user.email ?? "None";
      String phonenumber = user.phoneNumber ?? "None";
      Get.offAll(()=> WelcomeSample(email:user.email, phone:user.phoneNumber));
     //  Get.offAll(()=> WelcomeSample( ));
    }
  }

  void register(String email, password)async{
    print("email : " + email);
    print("password : " + password);
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      print("사용자 등록이 완료되었습니다.");
    }on FirebaseAuthException catch(error){
      print(error.code);
      String? _errorCode;
      switch (error.code){
        case "email-already-in-use":
          _errorCode = "이미 등록된 메일 주소 입니다. ${error.code}";
          break;
        case "invalid-email":
          _errorCode = "이메일 주소가 올바르지 않습니다. ${error.code}";
          break;
        case "weak-password":
          _errorCode = "패스워드는 6자이상 지정핫야 합니다. ${error.code}";
          break;
        case "operation-not-allowed":
          _errorCode = "허가되지 않은 요청입니다. ${error.code}";
          break;
        default:
          _errorCode = null;
      }
      if (_errorCode != null){
        Get.snackbar("Error Detail", _errorCode,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM
        );
      }

    }catch(e){
      Get.snackbar("About User", "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account creation failed",
          style: TextStyle(color: Colors.white)
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        )
      );
    }
  }

  void logIn(String email, password)async{
    print("email : " + email);
    print("password : " + password);
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("사용자 등록이 완료되었습니다.");
    }on FirebaseAuthException catch(error){
      String? _errorCode;
      switch (error.code){
        case "invalid-email":
          _errorCode = "이메일 주소가 올바르지 않습니다. ${error.code}";
          break;
        case "user-disabled":
          _errorCode = "사용자 활성화 상태가 아닙니다. ${error.code}";
          break;
        case "user-not-found":
          _errorCode = "사용자 정보를 찾을 수 없습니다. ${error.code}";
          break;
        case "wrong-password":
          _errorCode = "패스워드가 올바르지 않습니다. ${error.code}";
          break;
        default:
          _errorCode = null;
      }
      if (_errorCode != null){
        Get.snackbar("Login Error Detail", _errorCode,
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM
        );
      }
    }catch(e){
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
              "Login failed",
              style: TextStyle(color: Colors.white)
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          )
      );
    }
  }

  void logOut()async{
    print("로그 아웃 실행한다.....");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut(); // .disconnect(); //로그인시 여러개의 계정 중에 하나를 선택하라고 띄우고 싶을 경우 추가한다.
    await auth.signOut();
  }

  Future<void> signInWithGoogle(BuildContext context) async{
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? _account = await _googleSignIn.signIn();
    if (_account != null){
      GoogleSignInAuthentication _authentication = await _account.authentication;
      OAuthCredential _googleCredential = GoogleAuthProvider.credential(
        idToken: _authentication.idToken,
        accessToken: _authentication.accessToken
      );
      UserCredential _credential = await auth.signInWithCredential(_googleCredential);
      if (_credential.user != null){
        //_user = _credential.user as Rx<User?>;
        print("구글 접속 로그인 정보 : " + _user.string);
      }
    }
  }

  void singPhone() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+821028625570',
      verificationCompleted: (PhoneAuthCredential credential){

       //await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verficationId, int? resendToken) {
        AuthController.verify = verficationId;
        print("verficationId : ${verficationId}");
        Get.to(() => Phone());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void LoginPhone(String code) async{
    print("code : ${code}");
    String verify = AuthController.verify;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verify, smsCode: code);
    await auth.signInWithCredential(credential);
  }



}