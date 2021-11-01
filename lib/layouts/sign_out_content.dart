import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/services/AuthService.dart';

class SignOutContent extends StatelessWidget {
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
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          minWidth: 200,
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          onPressed: () => _signOut(context),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sign out",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
          ),
        ),
        /*Text(
          'Sign out',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.indigo[700]),
        ),
        MaterialButton(
          color: Colors.indigo[700],
          shape: CircleBorder(side: BorderSide.none),
          onPressed: () => _signOut(context),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
          ),
        ),*/
      ],
    );
  }
}

class MobileNavbar extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /*Text(
          'Sign out',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.indigo[700]),
        ),
        MaterialButton(
          color: Colors.indigo[700],
          shape: CircleBorder(side: BorderSide.none),
          onPressed: () => _signOut(context),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
          ),
        ),*/
        MaterialButton(
          minWidth: 200,
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          onPressed: () => _signOut(context),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sign out",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
