import 'package:flutter/material.dart';

class BubbleStories extends StatelessWidget {
  final String text;
  const BubbleStories({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[400]
            ),
          ),
          SizedBox(height: 5,),
          Text(text),
        ],
      ),
    );
  }
}
