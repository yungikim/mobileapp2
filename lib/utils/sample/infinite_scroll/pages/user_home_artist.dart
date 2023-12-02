import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/pages/user_detail_artist.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/util/image_card.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/util/loading_image.dart';

import '../controllers/user_controller.dart';
import '../util/image_cache.dart';
import '../models/user.dart';

class UserHomeArtist extends StatefulWidget {
  const UserHomeArtist({super.key, required this.title});

  final String title;

  @override
  State<UserHomeArtist> createState() => _UserHomeArtistState();
}

class _UserHomeArtistState extends State<UserHomeArtist> {
  var status = 0;
  bool visible = true;
  var selectkey = "1";

  late final ScrollController scrollerController2;

  late List<DropdownMenuItem<ValueOptions>> _valueItems;

  late ValueOptions _selectedValue;

  final UserController state2 = Get.put(UserController());

  final TextEditingController queryController = TextEditingController();

  @override
  void initState() {

    print("initState......................");

    scrollerController2 = ScrollController();
    scrollerController2.addListener(onScroll);

    state2.getUser();

    List<ValueOptions> values = ValueOptions.allValuesOptions;

    _valueItems =
        values.map<DropdownMenuItem<ValueOptions>>((ValueOptions valueOption) {
      return DropdownMenuItem<ValueOptions>(
        value: valueOption,
        child: Text(valueOption.title),
      );
    }).toList();

    _selectedValue = values[1];

    super.initState();
  }

  @override
  void disPose() {
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

    if (direction == ScrollDirection.forward) {
      show();
    } else {
      hidden();
    }

    double maxScroll = scrollerController2.position.maxScrollExtent;
    double currentScroll = scrollerController2.position.pixels;

    if (maxScroll == currentScroll && state2.hasMore.value) {
      state2.getUser();
    }
  }

  void show() {
    if (!visible) {
      setState(() {
        visible = true;
      });
    }
  }

  void hidden() {
    if (visible) {
      setState(() {
        visible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Future onRefresh() async {
      state2.refresh();
    }

    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              child: const Image(
                image: AssetImage("asset/images/logo/logo.png"),
                width: 130,
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
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
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: "Favorite"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Profile"),
                ],
              ),
            ],
          ),
        ),
        body: Obx(
          () => CustomScrollView(
            controller: scrollerController2,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                automaticallyImplyLeading: false,
                //leading 버튼을 숨긴다.
                // leading: IconButton(
                //   onPressed: () {
                //     Get.back();
                //   },
                //   icon: Icon(Icons.arrow_back_ios),
                // ),
                // actions: [
                //   IconButton(
                //     onPressed: () {},
                //     icon: Icon(Icons.search),
                //   )
                // ],
                floating: false,
                pinned: false,
                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.black,
                    child: const Image(
                      image: AssetImage("asset/images/logo/main-visual.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: const Text("A r t i s t"),
                  centerTitle: true,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey)
                          ),
                      child: DropdownButton<ValueOptions>(
                        isExpanded: true,

                        //  menuMaxHeight: 300.0,
                        //  itemHeight: null,
                        underline: SizedBox(),
                        value: _selectedValue,
                        items: _valueItems,
                        onChanged: (newValue) {
                         // setState(() {
                            _selectedValue = newValue!;
                            state2.type.value = _selectedValue.key;
                            state2.refreshData();
                            // state2.getUser();
                            // print(_selectedValue.key);
                        //  });
                        },
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      bottom: 1,
                      child: Container(
                        height: 10,
                        width: 150,
                        // color: Colors.red,
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            print("search query : $value");
                            state2.users.value = <User>[];
                            state2.searchUser(value);
                          },
                          controller: queryController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            contentPadding: const EdgeInsets.only(
                                top: 10.0, left: 6.0, bottom: 10.0),
                            hintText: '작가 검색',
                            hintStyle: TextStyle(
                                fontSize: 17.0, color: Colors.grey[500]),
                            focusedBorder: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 5,
                      top: 17,
                      child: Icon(
                        Icons.search,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              )),
              SliverList.builder(
                itemCount: state2.hasMore.value
                    ? state2.users.length + 1
                    : state2.users.length,
                itemBuilder: (context, index) {
                  if (index < state2.users.length) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => UserDetailArtist(
                            email: state2.users[index].email.toString(),
                          ),
                          transition: Transition.rightToLeft,
                          duration: Duration(microseconds: 500),
                        );
                      },
                      child: ImageCard(index: index),
                    );
                  } else {
                    return const LoadingImage();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ValueOptions {
  final String key;
  final String title;

  ValueOptions(this.key, this.title);

  static List<ValueOptions> get allValuesOptions => [
        ValueOptions("0", "랜덤정렬"),
        ValueOptions("1", "최신순"),
        ValueOptions("2", "이름순"),
      ];
}
