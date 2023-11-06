import 'package:flutter/material.dart';

import '../widgets/show_grid.dart';

class UserShop extends StatelessWidget {
  const UserShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shop", style: TextStyle(color: Colors.black),),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.black,),
                  SizedBox(width: 10,),
                  Icon(Icons.menu, color: Colors.black,),
                ],
              )
            ],
          ),
        )
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                padding: EdgeInsets.all(4),
                color: Colors.grey[300],
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[500]),
                    Text("Search", style: TextStyle(color: Colors.grey[500]),)
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: ShopGrid()),
        ],
      )
    );
  }
}
