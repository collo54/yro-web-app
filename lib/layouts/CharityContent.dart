import 'package:flutter/material.dart';

class CharityContent extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              "  Charity",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  color: Colors.black87),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                "We seek to unite young people in just causes in our community.\nActivities include organizing charity events, peace campaigns, counselling on teenage pregnancies and mental health",
                style: TextStyle(fontSize: 15.0, color: Colors.black87),
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
      SizedBox(
        height: 500,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Image.asset(
            "assets/images/donation-charity.jpg",
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
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
