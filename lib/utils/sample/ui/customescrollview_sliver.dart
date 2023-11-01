import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomScrollViewWithSliver extends StatefulWidget {
  const CustomScrollViewWithSliver({Key? key}) : super(key: key);

  @override
  State<CustomScrollViewWithSliver> createState() =>
      _CustomScrollViewWithSliverState();
}

class _CustomScrollViewWithSliverState
    extends State<CustomScrollViewWithSliver> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
            ),
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
            //  titlePadding: EdgeInsets.only(left: 40),
            //  titlePadding: EdgeInsets.zero,
              centerTitle: true,
              expandedTitleScale: 1,
              collapseMode: CollapseMode.parallax,
              title: const Text(
                "Custsome Scroll View",
                style: TextStyle( color: Colors.white),
              ),
              background: Lottie.asset("asset/lottie/animation1.json"),
              //background: Image(image: AssetImage("asset/images/on_boarding_images/b1.jpg"), fit: BoxFit.cover,),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text("Item $index"),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
