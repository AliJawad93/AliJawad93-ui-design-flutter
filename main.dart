import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Color color = Color.fromARGB(255, 0, 148, 5);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
          textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        headline2: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 182, 193)),
        headline3: TextStyle(fontSize: 15, color: Colors.black),
      )),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFavert = false;
  var titles = [
    "New in",
    "face",
    "care ",
    "Wow",
    "New make",
    "New in",
  ];
  var images = [
    "lib/images/makeup.jpg",
    "lib/images/makeup2.jpg",
    "lib/images/makeup3.jpg",
    "lib/images/makeup4.jpg",
    "lib/images/makeup5.jpg",
    "lib/images/makeup5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Container(
              width: Size.infinite.width,
              height: Size.infinite.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "   Get the \n   Best ",
                        style: Theme.of(context).textTheme.headline1),
                    TextSpan(
                        text: "Skincare.",
                        style: Theme.of(context).textTheme.headline2),
                  ])),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return circleCountainer(titles[index], images[index]);
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.only(top: 15),
                        itemCount: images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 15),
                        itemBuilder: (contex, index) {
                          return myCard(index, images[index]);
                        }),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              width: 280,
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home),
                  Icon(Icons.search),
                  Icon(Icons.shop_outlined),
                  Icon(Icons.account_circle_outlined),
                ],
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ], color: Colors.white, borderRadius: BorderRadius.circular(40)),
            )
          ])),
    );
  }

  Widget circleCountainer(String title, String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ClipOval(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(title, style: Theme.of(context).textTheme.headline3),
        ],
      ),
    );
  }

  Widget myCard(int i, String path) {
    return Container(
      height: 200,
      width: 150,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 150,
            width: 140,
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.only(left: 85),
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              child: Icon(
                Icons.add,
                size: 20,
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 182, 193),
                  shape: CircleBorder()),
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                height: 120,
                width: 120,
                padding: EdgeInsets.all(8),
                child: InkWell(
                  child: Icon(
                    isFavert ? Icons.favorite : Icons.favorite_outline,
                    color: Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      isFavert = !isFavert;
                    });
                  },
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(path),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Super Cream $i",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "\$39.3",
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
