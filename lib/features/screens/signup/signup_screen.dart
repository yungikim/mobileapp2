import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/common/ui/custom_appbar.dart';
import 'package:mobileapp/constants/colors.dart';
import 'package:mobileapp/constants/image_strings.dart';
import 'package:mobileapp/constants/sizes.dart';
import 'package:mobileapp/constants/text_strings.dart';
import 'package:mobileapp/features/screens/login/login_screen.dart';
import 'package:mobileapp/features/screens/signup/widget/signup_form_widget.dart';

import '../../../common/form/form_header_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "SignUp",
          //titleWidget: Icon(Icons.access_time, color: Colors.black,),
          //leading: Icon(Icons.home, color: Colors.black,),
          //showActionIcon: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: tDefaultSize, right: tDefaultSize, bottom: tDefaultSize),
            child: Column(
              children: [
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tr('tSignUpTitle'),
                  subTitle: tSignUpSubTitle,
                ),
                const SignUpFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                    const SizedBox(height: tFormHeight - 20,),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(tGoogleLogoImage),
                          width: 20.0,
                        ),
                        label: Text(tr('tSignInWithGoogle').toUpperCase()),
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "${tr('tAlreadyHaveAnAccount')}  ", style: Theme.of(context).textTheme.bodyLarge),
                            TextSpan(text: tr('tLogin').toUpperCase()),
                          ]
                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
