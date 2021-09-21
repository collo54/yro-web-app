import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/layouts/contact_content.dart';
import 'package:yro/layouts/final_stateful_form.dart';
import 'package:yro/services/AuthService.dart';
import 'package:yro/widgets/old_form.dart';
import 'package:yro/layouts/nav_bar.dart';

class LandingPage extends StatelessWidget {
  // ignore: unused_element
  void _signInWithEmail(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth),
      ),
    );
  }

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
