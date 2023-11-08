import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/controllers/user_controller.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/widgets/artist_express.dart';

class UserDetailArtist extends StatefulWidget {
  const UserDetailArtist({super.key, required this.email});

  final String email;

  @override
  State<UserDetailArtist> createState() => _UserDetailArtistState();
}

class _UserDetailArtistState extends State<UserDetailArtist> {
  final UserController _userController = Get.put(UserController());

  @override
  void initState() {
    _userController.artistDetail(widget.email.toString());
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
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                centerTitle: false,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                backgroundColor: Colors.black,
                title: Obx(
                  () => Text(
                    _userController.userInfo.value.nickname + "",
                    //   "kkk",
                    style: TextStyle(shadows: [
                      Shadow(
                        color: Colors.grey.shade900.withOpacity(1.0),
                        offset: Offset(3.0, 0.0),
                        blurRadius: 0.0,
                      )
                    ]),
                  ),
                ),
                expandedHeight: 300,
                pinned: true,
                floating: false,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.black,
                    //https://www.gallery360.co.kr/artimage/shinari93@gmail.com/photo_profile/shinari93@gmail.com_gray.jpg
                    //https://www.gallery360.co.kr/artimage/gallery360@gallery360.co.kr-spl-1598508967011/photo_profile/gallery360@gallery360.co.kr-spl-1598508967011_gray.jpg
                    // child: const Image(
                    //   image: AssetImage("asset/images/logo/main-visual.jpg"),
                    //   fit: BoxFit.cover,
                    // ),
                    child: Obx(
                      () => Image(
                        image: NetworkImage(
                            "https://www.gallery360.co.kr/artimage/${_userController.userInfo.value.email}/photo_profile/${_userController.userInfo.value.email}_gray.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //title: Text("작가 상세보기"),
                ),
                actions: [
                  //  IconButton(onPressed: (){}, icon: Icon(Icons.close, size: 30.0,)),
                ],
                bottom: TabBar(
                  indicatorColor: Colors.red,
                  labelStyle:
                      TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontSize: 15.0),
                  tabs: [
                    Tab(
                      //child: Text("작가 소개", style: TextStyle(fontSize: 20),),
                      text: "작가 소개",
                    ),
                    Tab(
                      text: '작품',
                    ),
                    Tab(
                      child: Text(
                        "VR 전시",
                        style: TextStyle(shadows: [
                          Shadow(
                            color: Colors.grey.shade900.withOpacity(1.0),
                            offset: Offset(1.0, 0.0),
                            blurRadius: 0.0,
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            body: TabBarView(
              children: [
                ArtistExpress(),
                ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Tab 2 content $index"),
                  );
                }),
                ListView.builder(itemBuilder: (context, index) {
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
