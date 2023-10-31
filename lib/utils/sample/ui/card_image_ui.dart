import 'package:flutter/material.dart';

class CardImageUI extends StatefulWidget {
  const CardImageUI({Key? key}) : super(key: key);

  @override
  State<CardImageUI> createState() => _CardImageUIState();
}

class _CardImageUIState extends State<CardImageUI> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(
              color: Color(0xFF363f93),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50)
              )
            ),
            child: Stack(
              children: [
                Positioned(
                  top:80,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )
                    ),
                  )
                ),
                Positioned(
                    top: 100,
                    left: 20,
                    child: Text("Your Books", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color(0xFF363f93)),))
              ]
            ),
          ),
          const SizedBox(height: 20,),
          Positioned(
            height: 230,
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  left: 20,
                  child: Material(
                    child: Container(
                      height: 180,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(-10.0, 10.0),
                            blurRadius: 20.0,
                            spreadRadius: 4.0
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 30,
                  child: Card(
                    elevation: 10.0,
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("asset/images/on_boarding_images/b1.jpg")
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ],


      ),
    );
  }
}
