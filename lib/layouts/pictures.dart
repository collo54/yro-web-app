//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_controller.dart';
//import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_pro/carousel_pro.dart';

final List<String> imgList = [
  "assets/images/download.png"
      "assets/images/downloadru.jpg"
      "assets/images/images.jpg"
      "assets/images/green-plants-outdoors_74855-10836.jpg"
      "assets/images/imagesagric.jpg"
      "assets/images/donation-charity.jpg"
      "assets/images/campingpic.jpg"
];

class Pictures extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /*MaterialButton(
              color: Colors.green[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            )*/
          ],
        ),
      ),
      SizedBox(
        height: 500,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Carousel(
              boxFit: BoxFit.cover,
              dotBgColor: Colors.teal[300],
              images: [
                Image.asset("assets/images/watsup1.jpeg"),
                Image.asset("assets/images/watsup2.jpeg"),
                Image.asset("assets/images/watsup5.jpeg"),
              ]),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Flex(
            direction: Axis.horizontal,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 3),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
