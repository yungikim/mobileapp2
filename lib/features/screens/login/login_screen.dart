import 'package:flutter/material.dart';
import 'package:mobileapp/constants/image_strings.dart';
import 'package:mobileapp/constants/sizes.dart';
import 'package:mobileapp/constants/text_strings.dart';

import 'login_foot_widget.dart';
import 'login_form_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHederWidget(size: size),
                //--section2
                LoginForm(),
                //--section3
                LoginFootForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
