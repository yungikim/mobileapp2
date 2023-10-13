
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mobileapp/features/screens/app/main_screen.dart';
import 'package:mobileapp/features/screens/login/login_screen.dart';
import 'package:mobileapp/utils/sample/login_sample.dart';
import 'package:mobileapp/utils/sample/login_sample/firebase_login.dart';
import 'package:mobileapp/utils/sample/login_sample/welcome_sample.dart';

class AuthController extends GetxController{
  //AuthController.instance ...
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

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
      Get.offAll(()=> LoginAppSample());
    }else{
      print("메인으로 이동해야 한다.");
      Get.offAll(()=> WelcomeSample(email:user.email!));
    }
  }

  void register(String email, password)async{
    print("email : " + email);
    print("password : " + password);
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      print("사용자 등록이 완료되었습니다.");

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
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("사용자 등록이 완료되었습니다.");

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
    await auth.signOut();
  }

}