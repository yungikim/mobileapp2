import 'package:flutter/material.dart';

class AccountTab1 extends StatelessWidget {
  const AccountTab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, idnex){
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          color: Colors.blue[100],
        ),
      );
    });
  }
}
