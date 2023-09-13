import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'simple_controller.dart';

void main() {
  runApp(SimpleStateManger());
}

class SimpleStateManger extends StatelessWidget {
  SimpleStateManger({super.key});

  SimpleController controller = Get.put(SimpleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<SimpleController>(
              init: SimpleController(),
              builder: (_) => Text(
                'Current value is : ${Get.find<SimpleController>().x}',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              //Get.find<SimpleController>().increment();
              controller.increment();
            }, child: Text('Add Number'))
          ],
        ),
      ),
    );
  }
}
