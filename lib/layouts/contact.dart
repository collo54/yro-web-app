import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class ContactContent extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text(
                "contact us",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: "+254 795 063199",
                  style: TextStyle(fontSize: 20.0, color: Colors.blue[600]),
                  recognizer: TapGestureRecognizer()..onTap = launchPhone,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: "+254 720 780486",
                  style: TextStyle(fontSize: 20.0, color: Colors.blue[600]),
                  recognizer: TapGestureRecognizer()..onTap = launchPhoneNumber,
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
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
          return Row(
            children: pageChildren(constraints.biggest.width / 4),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
