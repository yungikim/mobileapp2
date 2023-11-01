import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/utils/sample/infinite_scroll/controllers/user_controller.dart';

class MyHomeScroll extends StatefulWidget {
  const MyHomeScroll({super.key, required this.title});

  final String title;

  @override
  State<MyHomeScroll> createState() => _MyHomeScrollState();
}

class _MyHomeScrollState extends State<MyHomeScroll> {
  var status = 0;

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
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (status == 0) {
                    status = 1;
                  } else {
                    status = 0;
                  }
                });
              },
              icon: status == 0
                  ? const Icon(Icons.list)
                  : const Icon(Icons.grid_view),
              tooltip: 'Change List Type',
            ),
          ],
        ),
        body: Obx(
          () => status == 0 ? ListView.builder(
              controller: scrollController,
              itemCount: state.hasMore.value
                  ? state.users.length + 1
                  : state.users.length,
              itemBuilder: (context, index) {
                if (index < state.users.length) {
                  return  ArtistList(
                          state: state,
                          index: index,
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
              }) : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: state.hasMore.value
                          ? state.users.length + 1
                          : state.users.length,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://www.gallery360.co.kr/artimage/${state.users[index].email}/art/preview/${state.users[index].avatar}.jpg" ??
                                                ""),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                ListTile(
                                  title: Text(state.users[index].nickname
                                      ?.replaceAll("&#40;", "(")
                                      .replaceAll("&#41;", ")") ??
                                      ""),
                                  subtitle: Text("${state.users[index].name} | ${state.users[index].email?.split('-spl-')[0]}" ??
                                      ""),
                                  trailing: Icon(Icons.favorite),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),

        ));
  }
}

class ArtistList extends StatelessWidget {
  const ArtistList({super.key, required this.state, required this.index});

  final UserController state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://www.gallery360.co.kr/artimage/${state.users[index].email}/art/preview/${state.users[index].avatar}.jpg" ??
                ""),
      ),
      title: Text(state.users[index].nickname
              ?.replaceAll("&#40;", "(")
              .replaceAll("&#41;", ")") ??
          ""),
      subtitle: Text(
          "${state.users[index].name} | ${state.users[index].email?.split('-spl-')[0]}" ??
              ""),
    );
  }
}
//
// class Gridlist extends StatelessWidget {
//   const Gridlist({super.key, required this.state});
//
//   final UserController state;
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     print("Gridview 온다.");
//
//     return GridView.builder(
//       gridDelegate:
//           const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//       itemCount: state.hasMore.value
//           ? state.users.length + 1
//           : state.users.length,
//       controller: scrollController,
//       itemBuilder: (context, index) {
//         Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: Card(
//             elevation: 5,
//             child: Column(
//               children: [
//                 Container(
//                   height: 100,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: NetworkImage(
//                             "https://www.gallery360.co.kr/artimage/${state.users[index].email}/art/preview/${state.users[index].avatar}.jpg" ??
//                                 ""),
//                         fit: BoxFit.cover),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
