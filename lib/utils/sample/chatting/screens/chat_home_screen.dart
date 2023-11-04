import 'package:flutter/material.dart';
import 'package:mobileapp/utils/sample/chatting/data/color_data.dart';
import 'package:mobileapp/utils/sample/chatting/widgets/favorite_contact.dart';

import '../widgets/category_selector.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          title: const Text(
            'Chats',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            const CategorySelector(),
            Expanded(
              child: Container(
                height: 500.0,
                decoration: const BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: Column(
                  children: [
                    FavoriteContacts(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
