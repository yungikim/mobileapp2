import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';


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
            icon: Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20.0,
            ),
            onPressed: () {},
            label: Text(tSignInWithGoogle),
          ),
        ),
        SizedBox(
          height: tFormHeight - 20.0,
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                text: tDontHaveAnAccount + "  ",
                children: [
                  TextSpan(
                      text: tSignup,
                      style: TextStyle(color: Colors.blue)
                  )
                ]
            ),
          ),
        ),
      ],
    );
  }
}
