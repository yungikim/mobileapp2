import 'package:flutter/material.dart';
import 'package:mobileapp/utils/sample/instagram/widgets/bubble_stories.dart';

import '../widgets/account_tab1.dart';
import '../widgets/account_tab2.dart';
import '../widgets/account_tab3.dart';
import '../widgets/account_tab4.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Profile Photo
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  //number of posts, followers, following
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "237",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text("Posts", style: TextStyle(fontSize: 14.0),),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "3,930",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text("Followers", style: TextStyle(fontSize: 14.0),),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "40",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text("Following", style: TextStyle(fontSize: 14.0),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //name and bio
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "koko",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text('i create apps & games'),
                    ),
                    Text(
                      'm.youtube.com/mitckoko/',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Center(child: Text("Edit Profile"),),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Center(child: Text("Ad Tools"),),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Center(child: Text("Insights"),),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              //stories
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BubbleStories(text: "story 1"),
                      BubbleStories(text: "story 2"),
                      BubbleStories(text: "story 3"),
                      BubbleStories(text: "story 4"),
                      BubbleStories(text: "story 5"),
                      BubbleStories(text: "story 6"),
                    ],
                  ),
                ),
              ),

              const TabBar(
                //탭 글자색
                labelColor: Colors.black,
                //선택되지 않은 글자색
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.grey,
                tabs: [
                  Tab(
                    icon: Icon(Icons.grid_3x3_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.video_call),
                  ),
                  Tab(
                    icon: Icon(Icons.shop),
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                  )
                ],
              ),

              const Expanded(
                child: TabBarView(
                  children: [
                    AccountTab1(),
                    AccountTab2(),
                    AccountTab3(),
                    AccountTab4(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
