import 'package:flutter/material.dart';

class AccountTab3 extends StatelessWidget {
  const AccountTab3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, idnex){
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          color: Colors.red[100],
        ),
      );
    });
  }
}
