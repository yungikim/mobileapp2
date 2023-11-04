import 'package:flutter/material.dart';
import 'package:mobileapp/utils/sample/chatting/screens/chat_home_screen.dart';

class MainChat extends StatelessWidget {
  const MainChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      debugShowCheckedModeBanner: false,
      theme : ThemeData(
        primaryColor: Colors.red,

        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFFEF9EB),),
      ),
      home: ChatHomeScreen(),
    );
  }
}
