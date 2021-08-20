import 'package:flutter/material.dart';
import 'package:yro/custom/Nav_bar.dart';
import 'package:yro/custom/Sign_In_Form.dart';
import 'package:yro/layouts/contact.dart';
import 'package:yro/layouts/landingPage.dart';
import 'package:yro/layouts/pictures.dart';
import 'package:yro/layouts/second_content.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Navbar(),
            LandingPage(),
            SecondContent(),
            Pictures(),
            SignInForm(),
            SizedBox(
              height: 20,
            ),
            Container(color: Colors.teal[600], child: ContactContent()),
            /*DownloadImage(),*/
          ],
        ),
      ),
    );
  }
}
