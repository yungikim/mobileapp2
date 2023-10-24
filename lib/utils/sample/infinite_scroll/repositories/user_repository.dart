import 'dart:convert';


import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';


import '../models/user.dart';



class UserRepositry extends GetConnect{

  UserRepositry(){
    allowAutoSignedCert = true;
    timeout = const Duration(seconds: 30);

  }

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
  }
}

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    //token = AppConstance.TOKEN;
    allowAutoSignedCert = true;

    _mainHeaders = {
      'Content-type' : 'application/json, charset=UTF-8',
      'Authorization' : 'Bearer $token',
    };
  }

  Future<Response> getData(String url) async{
    try{
      Response response = await get(url);
      return response;
    }catch(e){
      return Response(statusCode:1, statusText: e.toString());
    }
  }

}
