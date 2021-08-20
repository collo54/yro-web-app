import 'package:flutter/material.dart';
import 'package:yro/layouts/Nav_bar.dart';
import 'package:yro/custom/form_content.dart';
import 'package:yro/layouts/contact_content.dart';
import 'package:yro/layouts/text_content.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Navbar(),
            Textcontent(),
            Formcontent(),
            Container(color: Colors.blueGrey[300], child: ContactContent()),
          ],
        ),
      ),
    );
  }
}
