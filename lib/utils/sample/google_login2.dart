import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main(){
  runApp(GoogleSignInApp());
}

class GoogleSignInApp extends StatefulWidget {
  const GoogleSignInApp({Key? key}) : super(key: key);

  @override
  _GoogleSignInAppState createState() => _GoogleSignInAppState();
}

class _GoogleSignInAppState extends State<GoogleSignInApp> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Sign In (Signed ' + (user == null ? 'out' : 'in') + ')'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () async {
                await _googleSignIn.signIn();
                print (user?.displayName );
                print (user?.email);
                print (user?.photoUrl);
                setState(() {

                });
              }, child: Text('Sing In')),
              ElevatedButton(onPressed: () async {
                await _googleSignIn.signOut();
                setState(() {

                });
              }, child: Text('Sing Out')),
            ],
          ),
        ),
      ),
    );
  }
}
