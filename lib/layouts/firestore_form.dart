import 'package:flutter/material.dart';
import 'package:yro/services/AuthService.dart';
import 'package:yro/widgets/form_page.dart';

class FormcontentFirestore extends StatelessWidget {
  final AuthService _auth = AuthService();

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
            Padding(
              padding: const EdgeInsets.all(20),
              child: FormPage(),
            ),
            SizedBox(
              height: 30.0,
            ),
            MaterialButton(
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
