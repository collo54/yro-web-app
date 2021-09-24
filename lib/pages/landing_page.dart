import 'package:flutter/material.dart';
import 'package:yro/layouts/contact_content.dart';
import 'package:yro/layouts/final_stateful_form.dart';
import 'package:yro/layouts/nav_bar.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Navbar(),
            FinalstatefulForm(),
            Container(
                height: 200,
                color: Colors.blueGrey[300],
                child: ContactContent()),
          ],
        ),
      ),
    );
  }
}
