import 'package:flutter/material.dart';
import 'package:yro/custom/Nav_bar.dart';
import 'package:yro/custom/Sign_In_Form.dart';
import 'package:yro/layouts/contact.dart';
import 'package:yro/layouts/landingPage.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Navbar(),
            LandingPage(),
            SignInForm(),
            SizedBox(
              height: 20,
            ),
            Container(color: Colors.blueGrey[300], child: ContactContent()),
          ],
        ),
      ),
    );
  }
}
