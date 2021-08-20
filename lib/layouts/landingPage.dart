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
                "The real revolution is the evolution of conciousness.YRO is a platform to share solutions and excecute them with the youth.We believe young people have the talents, education and energy to make the society better.\n \"For the young people who embrace the positive and the possible will emerge heroes an make us a thing.Therefore, a good starting point for all young people is to find a problem and solve, and if you solve a problem, heroism and success will naturaly follow you.\"    Mashujaa 2020.\n         #SISI KWA SISI.",
                style: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width),
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
