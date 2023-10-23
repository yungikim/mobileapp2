import 'dart:convert';


import 'package:get/get.dart';


import '../models/user.dart';
import 'package:get/get_connect/http/src/response/response.dart' as Response;


class UserRepositry extends GetConnect{
  final String _baseUrl = "https://www.gallery360.co.kr/load_artist_public.mon";
  Future<List<User>> fetchUsers(int page, int limit) async{

    try{
      int px = page -1 ;
      if (page > 1){
        px = (page -1)  * limit;
      }
      String url = "${_baseUrl}?start=$px&perpage=$limit&ty=1";

      final response = await get(url);

      print(Uri.parse(url));

      final data = response.body;

      return List<User>.from(data.map((e) => User.fromJson(e)));

    }catch(e){
     e.printError();
     return <User>[];
    }


  // return List<User>.from(data.map((e) => User.fromJson(e)));


  }



}
