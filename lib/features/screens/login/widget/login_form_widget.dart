import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/utils/sample/google_login.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/sample/google_login2.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {


      return Form(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline_outlined),
                  labelText: tr('tEmail'),
                  hintText: tr('tEmail'),
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(height: tFormHeight-20),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.fingerprint),
                    labelText: tr('tPassword'),
                    hintText: tr('tPassword'),
                    border: const OutlineInputBorder(),
                    suffixIcon: const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.remove_red_eye_sharp),
                    )
                ),
              ),
              const SizedBox(height: tFormHeight - 20,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){},
                  child: Text(tr(tForgetPassword)),
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Get.to(() => GoogleSignInApp());
                  }, child: Text(tr('tLogin').toUpperCase()))),
            ],
          ),
        ),
      );
    }
  }

