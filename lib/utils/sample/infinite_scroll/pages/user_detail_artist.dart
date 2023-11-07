import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/controllers/user_controller.dart';

class UserDetailArtist extends StatefulWidget {
  const UserDetailArtist({super.key, required this.email});
  final String email;


  @override
  State<UserDetailArtist> createState() => _UserDetailArtistState();
}

class _UserDetailArtistState extends State<UserDetailArtist> {
  final UserController userinfo = Get.put(UserController());

  @override
  void initState() {
    userinfo.artistDetail(widget.email.toString());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                centerTitle: true,
                leading: IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                backgroundColor: Colors.black,
                title: Text("작가 상세보기"),
                expandedHeight: 300,
                pinned: true,
                floating: false,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.black,
                    child: const Image(
                      image: AssetImage("asset/images/logo/main-visual.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  //title: Text("작가 상세보기"),
                ),
                actions: [
                //  IconButton(onPressed: (){}, icon: Icon(Icons.close, size: 30.0,)),
                ],
                bottom: const TabBar(
                  indicatorColor: Colors.red,
                  labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontSize: 17.0),
                  tabs: [
                    Tab(
                      child: Text("작가 소개", style: TextStyle(fontSize: 20),),
                    ),
                    Tab(text: '작품',),
                    Tab(text: 'VR갤러리',),
                  ],
                ),
              ),
            ],
            body: TabBarView(
              children: [
                ListView.builder(itemBuilder: (context, index){
                  return ListTile(
                    title: Text("Tab 1 content $index"),
                  );
                }),
                ListView.builder(itemBuilder: (context, index){
                  return ListTile(
                    title: Text("Tab 2 content $index"),
                  );
                }),
                ListView.builder(itemBuilder: (context, index){
                  return ListTile(
                    title: Text("Tab 3 content $index"),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
