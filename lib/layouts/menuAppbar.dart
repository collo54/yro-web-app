import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class MenuAppbar extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 600,
                width: 600,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Carousel(
                      boxFit: BoxFit.cover,
                      dotBgColor: Colors.teal[300],
                      images: [
                        Image.asset("assets/images/plantlady.png"),
                      ]),
                ),
              ),
            ]),
      ),
      /*Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Image.asset(
          "assets/images/downloadru.jpg",
        ),
      )*/
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pageChildren(constraints.biggest.width),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
