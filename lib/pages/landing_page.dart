import 'package:flutter/material.dart';
import 'package:yro/layouts/Nav_bar.dart';
import 'package:yro/layouts/form_content.dart';
import 'package:yro/layouts/contact_content.dart';
import 'package:yro/layouts/text_content.dart';
import 'package:yro/services/AuthService.dart';
import 'package:yro/widgets/old_form.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});
  final AuthService auth;

  void _signInWithEmail(BuildContext context) {
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
            Textcontent(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.indigo[700]),
                ),
                MaterialButton(
                  color: Colors.indigo[700],
                  shape: CircleBorder(side: BorderSide.none),
                  onPressed: () => _signInWithEmail(context),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Icon(
                      Icons.forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Formcontent(),
            Container(color: Colors.blueGrey[300], child: ContactContent()),
          ],
        ),
      ),
    );
  }
}