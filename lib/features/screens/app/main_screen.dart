import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/GetX/simple/simplestatemanager.dart';

import '../../../utils/GetX/reactiveX/reactivexmanager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(()=> SimpleStateManger());
            }, child: Text("GetX Text1"),
            style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), padding: EdgeInsets.all(30), backgroundColor: Colors.blue,),
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Get.to(()=> ReactiveX());
            }, child: Text("ReactiveX GetX"),
            style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20), padding: EdgeInsets.all(30), backgroundColor: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
