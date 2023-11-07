import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/controllers/user_controller.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/pages/user_home.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/util/loading_image.dart';

import '../util/image_card.dart';

class UserHomeArtistNew extends StatefulWidget {
  const UserHomeArtistNew({super.key});

  @override
  State<UserHomeArtistNew> createState() => _UserHomeArtistNewState();
}

class _UserHomeArtistNewState extends State<UserHomeArtistNew> {

  late List<DropdownMenuItem<ValueOptions>> _valueItems;
  late ValueOptions _selectedValue;

  late final ScrollController scrollController3;
  final UserController state3 = Get.put(UserController());

  @override
  void initState() {
    List<ValueOptions> values = ValueOptions.allValuesOptions;

    _valueItems =
        values.map<DropdownMenuItem<ValueOptions>>((ValueOptions valueOption) {
          return DropdownMenuItem<ValueOptions>(
            value: valueOption,
            child: Text(valueOption.title),
          );
        }).toList();

    _selectedValue = values[1];

    scrollController3 = ScrollController();
    scrollController3.addListener(onScroll);
    state3.getUser();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController3.dispose();
    scrollController3.removeListener(onScroll);
    super.dispose();
  }

  void onScroll(){
    double maxScroll = scrollController3.position.maxScrollExtent;
    double currentScroll = scrollController3.position.pixels;
    if (maxScroll == currentScroll && state3.hasMore.value){
      state3.getUser();
    }
  }

  Future onRefresh() async{
    state3.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
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
                width: 120,
              ),
            ),
          ),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        ),
        body: SingleChildScrollView(
          controller: scrollController3,
          child: Column(
            children: [
              Container(
                width: width,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage("asset/images/logo/main-visual.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Stack(
                  children: [
                    Positioned(
                      bottom: 100,
                      left: 10,
                      child: Text(
                        "순간이 아닌\n영원을 바라 보는 시선",
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //소트 선택 콤보 박스
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 100,
                      child: DropdownButton<ValueOptions>(
                        isExpanded: true,
                        underline: SizedBox(),
                        value: _selectedValue,
                        items: _valueItems,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue!;
                            print(_selectedValue.key);
                          });
                        },
                      ),
                    ),
                  ),
                  //검색 필드
                  Row(
                    children: [
                      Container(
                        width: 100,
                        //  color: Colors.red,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: ' 작가 검색',
                              hintStyle: TextStyle(
                                  fontSize: 15.0, color: Colors.grey[500]),
                              border: UnderlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 7.0),
                              isDense: true,
                              focusedBorder: UnderlineInputBorder()
                          ),
                        ),
                      ),
                      Container(
                        //  color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, top: 5),
                            child: IconButton(
                              onPressed: () {},
                              iconSize: 20,
                              icon: Icon(Icons.search),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          )
                      )
                    ],
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
               // physics: const BouncingScrollPhysics(),
                physics: NeverScrollableScrollPhysics(),
              //  controller: scrollController3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemCount: state3.hasMore.value ? state3.users.length + 1 : state3.users.length,
                itemBuilder: (context, index){
                  if (index < state3.users.length){
                    return ImageCard(index: index);
                  }else{
                    return const LoadingImage();
                  }
                },
              ),

            ],
          ),
        ),

    );
  }
}


class ValueOptions {
  final String key;
  final String title;

  ValueOptions(this.key, this.title);

  static List<ValueOptions> get allValuesOptions =>
      [
        ValueOptions("0", "랜덤정렬"),
        ValueOptions("1", "최신순"),
        ValueOptions("2", "이름순"),
      ];
}

