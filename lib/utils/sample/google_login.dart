import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends StatelessWidget {
  GoogleLogin({Key? key}) : super(key: key);

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () async{
                await _googleSignIn.signIn();
                print(user?.displayName);
                print(user?.email);
                print(user);
              }, child: Text("Google Login")),
              ElevatedButton(onPressed: () async{
                await _googleSignIn.signOut();
              }, child: Text("Sign Out")),

            ],
          ),
        ),
      ),
    );
  }
}
