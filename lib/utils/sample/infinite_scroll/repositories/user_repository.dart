import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/models/user_detail.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserRepositry extends GetConnect {
  UserRepositry() {
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);
  }

  final String _baseUrl = "https://www.gallery360.co.kr/load_artist_public.mon";
  final String _baseUrl_search =
      "https://www.gallery360.co.kr/search_artist_public.mon";
  final String _baseUrl_artist_detail =
      "https://www.gallery360.co.kr/load_artist_detail_public.mon";

  Future<List<User>> fetchUsers(int page, int limit, String type) async {
    try {
      int px = page - 1;
      if (page > 1) {
        px = (page - 1) * limit;
      }
      String url = "${_baseUrl}?start=$px&perpage=$limit&ty=$type";
      final response = await get(url);
      print(Uri.parse(url));
      final data = response.body;
      return List<User>.from(data.map((e) => User.fromJson(e)));
    } catch (e) {
      e.printError();
      return <User>[];
    }
  }

  Future<List<User>> searchUsers(
      int page, int limit, String type, String query) async {
    try {
      int px = page - 1;
      if (page > 1) {
        px = (page - 1) * limit;
      }
      px = 0;
      String url = "${_baseUrl_search}?q=$query&start=$px&perpage=$limit&ty=0";
      final response = await get(url);
      final data = response.body;
      return List<User>.from(data.map((e) => User.fromJson(e)));
    } catch (e) {
      e.printError();
      return <User>[];
    }
  }

  Future<String> artistDetail(String email) async {
    //try {
      String url = "${_baseUrl_artist_detail}?email=$email";
      print(url);
      // final response = await get(url);
      // final data = response.body.toString();

      final response2 = await http.get(Uri.parse(url));
      print(response2.body);
      if (response2.statusCode == 200) {
        print("111111111111111111");
        print(response2.body);
       // final UserDetail user2 = userDetailFromJson(response2.body);
        print("first nicknae");
       // print(userDetailFromJson(response2.body));
       // print(user2.nickname);
        return response2.body;
      } else {
        //Fluttertoast.showToast(msg: "Error occurred. Please try again");
        return "";
      }

     // return jsonDecode(data);
      print("!!!!!!!!!!!!!!!!!!!!!");
      // print(data);
      // print("!!!!!!!!!!!!!!!!!!!");
      // print(jsonEncode(data));
      // print("!!!!!!!!!!!!!!!!!!!");
      // print(data['career']);
      //print(userDetailFromJson(data));

      // final UserDetail user = userDetailFromJson(data);
      // print(user.nickname);
      // return user;

      //return data;

      // print("data['career']");
      // print(data);
      // print(data['career']);

      // final List<User> user = userFromJson(response.body);
      // return user;

      // final List<UserDetail> user = userDetailFromJson(data);
      // return user;
      // return UserDetail(
      //   email: data['email'].toString().split("-spl-")[0],
      //   name: data['name'].toString(),
      //   nickname: data['nickname'].toString(),
      //   photoprofile: data['photoimage_profile'].toString(),
      //   photoprofileversion: data['photoimage_profile_version'].toString(),
      //   carerr: data['career'],
      // );
    // } catch (e) {
    //   e.printError();
    //   return UserDetail();
    //   //return <dynamic>;
    //   // return UserDetail(
    //   //   email: "",
    //   //   name: "",
    //   //   nickname: "",
    //   //   photoprofileversion: "",
    //   //   photoprofile: "",
    //   //   carerr: [],
    //   // );
    // }
  }
}

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    //token = AppConstance.TOKEN;
    allowAutoSignedCert = true;

    _mainHeaders = {
      'Content-type': 'application/json, charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String url) async {
    try {
      Response response = await get(url);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
