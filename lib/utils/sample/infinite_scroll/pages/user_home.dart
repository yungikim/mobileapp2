import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/controllers/user_controller.dart';

class MyHomeScroll extends StatelessWidget {
  const MyHomeScroll({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final UserController state = Get.put(UserController());
    state.getUser();

    Future onRefresh() async {
      state.refresh();
    }

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      if (maxScroll == currentScroll && state.hasMore.value) {
        state.getUser();
      }
    }

    scrollController.addListener(onScroll);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title, style: TextStyle(color: Colors.black),),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Obx(
          () => ListView.builder(
            controller: scrollController,
            itemCount: state.hasMore.value ? state.users.length +1 : state.users.length,
            itemBuilder: (context, index) {
                  if (index < state.users.length) {
                    return  ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.gallery360.co.kr/artimage/${state.users[index].email}/art/preview/${state.users[index].avatar}.jpg" ??
                                ""),
                      ),
                      title: Text(state.users[index].nickname?.replaceAll("&#40;", "(").replaceAll("&#41;", ")") ?? ""),
                      subtitle: Text(
                          "${state.users[index].name} | ${state.users[index].email?.split('-spl-')[0]}" ??
                              ""),
                    );
                  }
                  else {
                    return const Padding(
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                }


          ),
        ));
  }
}
