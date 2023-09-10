import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/features/screens/signup/signup_screen.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';


class LoginFootForm extends StatelessWidget {
  const LoginFootForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20.0,
            ),
            onPressed: () {},
            label: Text(tr('tSignInWithGoogle')),
          ),
        ),
        const SizedBox(
          height: tFormHeight - 20.0,
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpScreen());
          },
          child: Text.rich(
            TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                text: "${tr('tDontHaveAnAccount')}  ",
                children: [
                  TextSpan(
                      text: tr('tSignup'),
                      style: const TextStyle(color: Colors.blue)
                  )
                ]
            ),
          ),
        ),
      ],
    );
  }
}
