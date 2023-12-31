import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobileapp/features/screens/login/login_screen.dart';
import 'package:mobileapp/view/main/main_screen.dart';

class AuthService {
  //1. handleAuthState()

  //2. signInWithGoogle()
  signInWithGoogle() async{
    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]).signIn();

    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    //Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    //Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //3. signOut()
  //Determine if the user is authenticated
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot){
          if (snapshot.hasData){
            return MainScreen();
          }else{
            return const LoginScreen();
          }
        });
  }
}