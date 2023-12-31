import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/user_controller.dart';
import 'image_cache.dart';

class ImageCard extends StatelessWidget {
  final int index;
  const ImageCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    final UserController state2 = Get.put(UserController());
    final width = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ImageLoadCache(
              width: width * 0.49,
              height: 200,
              url:
              "https://www.gallery360.co.kr/artimage/${state2.users[index].email}/art/preview/${state2.users[index].avatar}.jpg",
            ),
          ),
          Container(
              width: width * 0.49,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  //image: new CachedNetworkImageProvider("https://www.gallery360.co.kr/artimage/${state2.users[index].email}/photo_list/${state2.users[index].email}_gray.jpg"),
                  image: NetworkImage(
                      "https://www.gallery360.co.kr/artimage/${state2.users[index].email}/photo_list/${state2.users[index].email}_gray.jpg" ??
                          ""),
                  fit: BoxFit.cover,
                ),
              ),
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
                      style:
                      const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.vrpano,
                                color: Colors.white, size: 20),
                            Text(
                              state2.users[index].vrcount ==
                                  null
                                  ? "  "
                                  : state2.users[index].vrcount
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const Icon(
                              Icons.article_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              state2.users[index].artcount ==
                                  null
                                  ? " "
                                  : state2.users[index].artcount
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
