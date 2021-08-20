import 'package:flutter/material.dart';
import 'package:yro/widgets/old_form.dart';
import 'package:yro/models/user_model.dart';
import 'package:yro/services/AuthService.dart';

class Formcontent extends StatelessWidget {
  final FirebaseAuthService _auth = FirebaseAuthService();

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
              "   Welcome",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.black87),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 1),
              child: Form(
                child: OldForm(
                  user: Userre(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: MaterialButton(
                color: Colors.green[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () async {
                  dynamic usercredential = await _auth.signInAnonymously();
                  if (usercredential == null) {
                    print('error siging in');
                  } else {
                    print('signed in');
                    print(usercredential.uid);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40.0),
                  child: Text(
                    "          Sign Up         ",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: MaterialButton(
                color: Colors.blue[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () async {
                  dynamic usercredential = await _auth.signInWithGoogle();
                  if (usercredential == null) {
                    print('error siging in');
                  } else {
                    print('signed in');
                    print(usercredential.uid);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40.0),
                  child: Text(
                    "Sign Up with google",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
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
            children: pageChildren(constraints.biggest.width / 3),
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
