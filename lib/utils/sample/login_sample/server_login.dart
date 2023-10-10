import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/data/data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ServerLoginController {

  void login(String email, String password) async{
    final dio = Dio();
    print("서버 로그인 하러 왔다.");
    print("email : " + email);
    print("password : " + password);

    final rawString = "$email:$password";
    print(rawString);
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String token = stringToBase64.encode(rawString);

    print(token);

    final resp = await dio.post(
      '${server_ip}/login.mon',
       options: Options(
         headers: {
           'authorization' : 'Basic $token',
         },
       ),
    );

    final result = resp.data['result'];
    if (result == "success"){
      print("로그인 성공하였습니다.");
      final refreshToken = resp.data['refreshToken'];
      final accessToken = resp.data['accessToken'];

      print("refreshToken : ${refreshToken}");
      print("accessToken : ${accessToken}");

      await storage.write(key: REFRESH_TOKEN_KEY, value: refreshToken);
      await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
    }else{
      print("로그인 실패 했습니다.");
    }




  }
}

