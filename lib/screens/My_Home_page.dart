import 'package:flutter/material.dart';

import 'package:yro/custom/Nav_bar.dart';
import 'package:yro/custom/Sign_In_Form.dart';
import 'package:yro/screens/CharityContent.dart';
import 'package:yro/screens/contact.dart';
import 'package:yro/screens/landingPage.dart';
import 'package:yro/screens/pictures.dart';
import 'package:yro/screens/second_content.dart';
/*import 'package:youthrevolution/screens/downloadImage.dart';
import 'package:youthrevolution/screens/landingPage.dart';
import 'package:youthrevolution/screens/second_content.dart';*/

class MyHomePage extends StatelessWidget {
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
