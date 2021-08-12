import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class ContactContent extends StatelessWidget {
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
              "     contact us",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.black87),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: RichText(
                text: TextSpan(
                  text: "   +254 720 780486",
                  style: TextStyle(fontSize: 20.0, color: Colors.blue[600]),
                  recognizer: TapGestureRecognizer()..onTap = launchPhoneNumber,
                  children: [
                    TextSpan(
                      text: "  \n\n   +254 795 063199\n\n\n\n\n\n",
                      recognizer: TapGestureRecognizer()..onTap = launchPhone,
                    ),
                  ],
                ),
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
          "assets/images/donation-charity.jpg",
        ),
      )*/
    ];
  }

  Future launchPhoneNumber() async {
    String phoneNumber = '+254 720 780486';

    await launch('tel:$phoneNumber');
  }

  Future launchPhone() async {
    String phoneNumber = '+254 795 063199';

    await launch('tel:$phoneNumber');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Flex(
            direction: Axis.horizontal,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2),
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
