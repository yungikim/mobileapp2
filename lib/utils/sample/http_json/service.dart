import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static const String url2 = "https://www.gallery360.co.kr/load_artist_public.mon?start=0&perpage=15&ty=1";

  static Future<List<User>> getInfo() async {
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        final List<User> user = userFromJson(response.body);
        return user;
      } else {
        Fluttertoast.showToast(msg: "Error occurred. Please try again");
        return <User>[];
      }
    } catch (e) {
      return <User>[];
    }
  }

  static Future<List<User>> getInfo2() async {
    final Dio dio = new Dio();

    //dio사용하는 기본 방법
    // final response1 = await dio.get(url);
    // final response2 =
    //     await dio.get(url, queryParameters: {'id': 12, 'name': "김윤기"});
    // final response3 = await dio.request(
    //   url,
    //   data : {'id' : 12, 'name' : "김윤기"},
    //   options: Options(method: "GET"),
    // );
    // final response4 = await dio.post(url, data: {'id' : 12, 'name' : "김윤기"});
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200){
        print("response.data : ${response.data}");
        List<User> user = (response.data).map<User>((json){
          return User.fromJson(json);
        }).toList();

        print(user.length);
        return user;
      }else{
        Fluttertoast.showToast(msg: "Error occurred. Please try again");
        return <User>[];
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error occurred. Please try again");
      return <User>[];
    }
  }
}
