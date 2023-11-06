import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/user_controller.dart';

class UserHomeArtist extends StatefulWidget {
  const UserHomeArtist({super.key, required this.title});

  final String title;

  @override
  State<UserHomeArtist> createState() => _UserHomeArtistState();
}

class _UserHomeArtistState extends State<UserHomeArtist> {
  var status = 0;
  bool visible = true;

  late final ScrollController scrollerController2;
  final UserController state2 = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    scrollerController2 = ScrollController();
    scrollerController2.addListener(onScroll);
  }

  @override
  void disPose(){
    super.dispose();
    scrollerController2.dispose();
    scrollerController2.removeListener(onScroll);
  }

  void onScroll() {

   // print("onScroll....");
    final direction = scrollerController2.position.userScrollDirection;
    // if (_scrollController.position.pixels >=2000){
    //   //조건을 변경할 수 있다. 특정 높이 이상 올라 갔을때 숨기기
    //   show();
    // }else{
    //   hidden();
    // }

    if (direction == ScrollDirection.forward){
      show();
    }else{
      hidden();
    }


    double maxScroll = scrollerController2.position.maxScrollExtent;
    double currentScroll = scrollerController2.position.pixels;
    if (maxScroll == currentScroll && state2.hasMore.value) {
      state2.getUser();
    }
  }

  void show(){
    if (!visible) {
      setState(() {
        visible = true;
      });
    }
  }

  void hidden(){
    if (visible){
      setState(() {
        visible = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {


    state2.getUser();

    Future onRefresh() async {
      state2.refresh();
    }



 //   scrollerController2.addListener(onScroll);

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        // scale: visible ? 1 : 0.0,
        // alignment: Alignment.bottomCenter,
        curve: Curves.fastLinearToSlowEaseIn,
        height: visible ? 57 : 0,
        child: Wrap(
          spacing: 0.0,
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
              ],
            ),],

        ),
      ),

      body: Obx(
        () => CustomScrollView(
          controller: scrollerController2,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              floating: false,
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.black,
                  child: const Image(
                    image: AssetImage("asset/images/logo/main-visual.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text("A r t i s t"),
                centerTitle: true,
              ),
            ),
            SliverList.builder(
              itemCount: state2.hasMore.value
                  ? state2.users.length + 1
                  : state2.users.length,
              itemBuilder: (context, index) {
                if (index < state2.users.length) {
                  return Card(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: width * 0.49,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.gallery360.co.kr/artimage/${state2.users[index].email}/art/preview/${state2.users[index].avatar}.jpg" ??
                                      ""),
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        Container(
                            width: width * 0.49,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.gallery360.co.kr/artimage/${state2.users[index].email}/photo_list/${state2.users[index].email}_gray.jpg" ??
                                      ""),
                              fit: BoxFit.cover,
                            )),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${state2.users[index].nickname}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${state2.users[index].ename}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.vrpano,
                                              color: Colors.white, size: 20),
                                          Text(
                                            state2.users[index].vrcount == null
                                                ? "  "
                                                : state2.users[index].vrcount
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          const SizedBox(width: 5.0,),
                                          const Icon(
                                            Icons.article_outlined,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          Text(
                                            state2.users[index].artcount == null
                                                ? " "
                                                : state2.users[index].artcount
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),

                                      Icon(Icons.favorite_border, color: Colors.white,),
                                    ],
                                  )

                                  // Container(
                                  //   height: 70,
                                  //   width: 70,
                                  //   color: Colors.red,
                                  //   child: Icon(Icons.search),
                                  // ),
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   iconSize: 20.0,
                                  //   color: Colors.white,
                                  //   icon: Icon(Icons.search),
                                  // ),
                                  // IconButton(
                                  //
                                  //   onPressed: () {},
                                  //   icon: Icon(Icons.search),
                                  // )
                                ],
                              ),
                            )),
                      ],
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
