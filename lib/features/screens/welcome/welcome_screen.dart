import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/constants/colors.dart';
import 'package:mobileapp/constants/image_strings.dart';
import 'package:mobileapp/constants/sizes.dart';
import 'package:mobileapp/constants/text_strings.dart';
import 'package:mobileapp/features/screens/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(tWelcomeScreenImage), height: height * 0.6),
            Column(
              children: [
                Text(tWelcomeTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(
                  tWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: Text(tLogin.toUpperCase())),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(tSignup.toUpperCase())),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
