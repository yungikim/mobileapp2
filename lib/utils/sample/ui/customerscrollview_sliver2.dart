import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

class CustomScrollWidthSlive2 extends StatefulWidget {
  const CustomScrollWidthSlive2({Key? key}) : super(key: key);

  @override
  State<CustomScrollWidthSlive2> createState() => _CustomScrollWidthSlive2State();
}

class _CustomScrollWidthSlive2State extends State<CustomScrollWidthSlive2> {

  late ScrollController _scrollController;
  bool visible = true;

  @override
  void initState(){
    print("initState ....................");
    super.initState();
     _scrollController = ScrollController();
     _scrollController.addListener(listen);
  }

  @override
  void disPose(){
    print("disPose......................");
    super.dispose();
    _scrollController.dispose();
    _scrollController.removeListener(listen);

  }

  void listen(){
    // print("listen....");
    final direction = _scrollController.position.userScrollDirection;
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
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
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
          ),
          ],
          // child: BottomNavigationBar(
          //   items: const [
          //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          //   ],
          // ),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.pink,
            leading: const Icon(Icons.menu),
            floating: false,
            pinned: true,
          //  title: Text("S L I V E R A P P B A R"),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.pink,
                child: Lottie.asset("asset/lottie/animation1.json"),
              ),
              //background: Lottie.asset("asset/lottie/animation1.json"),
              title: const Text("S L I V E R A P P B A R", style: TextStyle(fontSize: 15),),
              centerTitle: true,
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index){
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 400,
                      color: Colors.deepPurple[300],
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          )



          // SliverToBoxAdapter(
          //   child: ListView.builder(
          //   //  controller: _scrollController,
          //     shrinkWrap: true,
          //     itemCount: 10,
          //     itemBuilder: (context, index){
          //       return Padding(
          //         padding: const EdgeInsets.all(20.0),
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(20),
          //           child: Container(
          //             height: 400,
          //             color: Colors.deepPurple[300],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),





          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: EdgeInsets.all(20.0),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: Container(
          //         height: 400,
          //         color: Colors.deepPurple[300],
          //       ),
          //     ),
          //   ),
          // ),
          //
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: EdgeInsets.all(20.0),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: Container(
          //         height: 400,
          //         color: Colors.deepPurple[300],
          //       ),
          //     ),
          //   ),
          // ),
          //
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: EdgeInsets.all(20.0),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: Container(
          //         height: 400,
          //         color: Colors.deepPurple[300],
          //       ),
          //     ),
          //   ),
          // ),

        ],
      ),
    );
  }
}
