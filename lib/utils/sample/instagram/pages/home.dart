import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/instagram/widgets/bubble_stories.dart';
import 'package:mobileapp/utils/sample/instagram/widgets/user_post.dart';

class UserHome extends StatelessWidget {
  UserHome({Key? key}) : super(key: key);

  final List<String> user = [
    "kotathefried",
    "obama",
    "mitch",
    "joeybadass",
    "zuckerberg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Instagram",
                style: TextStyle(color: Colors.black),
              ),
              Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return BubbleStories(text: user[index]);
                },
              ),
            ),

            //Post
            Expanded(
              child: ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index){
                  return UserPost(name: user[index]);
                },
              ),
            ),
          ],
        ));
  }
}
