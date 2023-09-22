import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller.dart';

class ReactiveX extends StatelessWidget {
  ReactiveX({super.key});

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReactiveX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.amber),
              child: Center(
                  child: GetX<Controller>(
                builder: (_) => Text(
                  "name : ${controller.person().name}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              )),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.red),
              child: Center(
                  child: Obx(
                () => Text(
                  "Age : ${controller.person().age}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              )),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
              child: Center(
                child: GetX(
                    init: Controller(),
                    builder: (_) => Text(
                      "Aget : ${Get.find<Controller>().person().age}",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),)
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateInfo();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
