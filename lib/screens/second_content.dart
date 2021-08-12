import 'package:flutter/material.dart';

class SecondContent extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            /*Text(
              "  Young\n  Revolutionary\n  Organization",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  color: Colors.black87),
            ),*/
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 20.0),
              child: Text(
                "\n \"For the young people who embrace the positive and the possible will emerge heroes an make us a thing.Therefore, a good starting point for all young people is to find a problem and solve, and if you solve a problem, heroism and success will naturaly follow you.\"    Mashujaa 2020.\n         #SISI KWA SISI.",
                style: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.all(
                50.0,
              ),
              child: MaterialButton(
                color: Colors.green[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {Navigator.of(context).pushNamed('/login');},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            )*/
          ],
        ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 4),
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
