import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/services/AuthService.dart';

class SignInContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInAnonymously();
      print('uid: ${user.uid}');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Sign up Anonymously',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.indigo[700]),
        ),
        MaterialButton(
          color: Colors.indigo[700],
          shape: CircleBorder(side: BorderSide.none),
          onPressed: () => _signInAnonymously(context),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Icon(
              Icons.forward,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class MobileNavbar extends StatelessWidget {
  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInAnonymously();
      print('uid: ${user.uid}');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Sign up anonymously',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.indigo[700]),
        ),
        MaterialButton(
          color: Colors.indigo[700],
          shape: CircleBorder(side: BorderSide.none),
          onPressed: () => _signInAnonymously(context),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Icon(
              Icons.forward,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
