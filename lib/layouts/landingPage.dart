import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              "   Young\n   Revolutionary\n   Organization",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  color: Colors.black87),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 1),
              child: Text(
                "The real revolution is the evolution of conciousness.YRO is a platform to share solutions and excecute them with the youth.We believe young people have the talents, education and energy to make the society better.",
                style: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ),
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
