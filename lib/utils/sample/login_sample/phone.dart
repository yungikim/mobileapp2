import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_controller.dart';


class Phone extends StatelessWidget {
  final id = "";
  const Phone({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController countryController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Login"),
        ),
      body: Column(
        children: [
          TextField(
            controller: countryController,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(onPressed: () async{
            String code = countryController.text;
            AuthController.instance.LoginPhone(code);
          }, child: Text("인증하기"))
        ],

      ),
    );
  }
}
