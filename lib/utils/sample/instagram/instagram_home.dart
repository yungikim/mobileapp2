import 'package:flutter/material.dart';
import 'package:mobileapp/utils/sample/instagram/pages/account.dart';
import 'package:mobileapp/utils/sample/instagram/pages/home.dart';
import 'package:mobileapp/utils/sample/instagram/pages/reels.dart';
import 'package:mobileapp/utils/sample/instagram/pages/search.dart';
import 'package:mobileapp/utils/sample/instagram/pages/shop.dart';

class InstagramHome extends StatefulWidget {
  const InstagramHome({Key? key}) : super(key: key);

  @override
  State<InstagramHome> createState() => _InstagramHomeState();
}

class _InstagramHomeState extends State<InstagramHome> {
  int _selectedIndex = 0;
  void _navigateBottomNavBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  //각 하단탭을 클릭할때 이동하는 페이지
  final List _children =[
    UserHome(),
    UserSearch(),
    UserReels(),
    UserShop(),
    UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _navigateBottomNavBar,
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: 'reels'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'account'),
        ],
      ),
    );
  }
}
